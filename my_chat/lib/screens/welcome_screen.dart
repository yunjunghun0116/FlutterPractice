import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
/*SingleTickerProviderStateMixin : 하나의 애니메이션(Animation Controller에 사용될)을 정의 -> vsync:this 이용 */

  AnimationController _controller;
  Animation _animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
    /*
    forward : 0.0~1.0 실행
    reverse : 1.0~0.0 실행
    stop : 중지
     */
    _animation.addStatusListener((status) {
      print(status);
      /*animation이 끝나면 status의 변화를 알려줌 ex)completed
      하지만 만약 _controller를 reverse()로 동작시키면
      status가 completed가 아닌 dismissed를 반환함
      -> 무한반복하기에 좋음
      if(completed) _controller.reverse();
      else _controller.forward();의 방식처럼 무한반복하기에 좋다
       */
    });
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(_controller.value),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                Text(
                  '정훈톡',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  '${_animation.value * 100}%',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0, //z값을 나타낸다.
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    //Go to login screen.
                    Navigator.pushNamed(context, '/login');
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    //Go to registration screen.
                    Navigator.pushNamed(context, '/register');
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Register',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
