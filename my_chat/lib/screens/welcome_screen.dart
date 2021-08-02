import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../components/using_buttons.dart';

//mixin a and class ~~~ with a 처럼 함수만을위해서 만들어놓았다가 필요한 함수만 재사용하는방식으로
class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
/*SingleTickerProviderStateMixin : 하나의 애니메이션(Animation Controller에 사용될)을 정의 -> vsync:this 이용 */

//Animation은 한 위젯내에서 어느 위젯 ex)image 에 대해 적용할때 유용하게 쓰일수있음
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
    _controller.forward();
    /*
    forward : 0.0~1.0 실행
    reverse : 1.0~0.0 실행
    stop : 중지
     */
    /* animation 적용시 필요
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
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
     */
    _animation = ColorTween(begin: Colors.lightBlue, end: Colors.white)
        .animate(_controller);
    _controller.addListener(() {
      setState(() {});
    });
  }

  //initState가 위젯이 생성될때 호출되는것이면 dispose는 완전히 종료될때 호출된다.
  //메모리를 많이 잡아먹지 않도록하기위해 꼭 넣어주는것이 좋다.
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _animation.value,
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
                AnimatedTextKit(
                  totalRepeatCount: 1,
                  animatedTexts: [
                    TyperAnimatedText(
                      'Welcome',
                      textStyle: TextStyle(
                        fontSize: 48.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    TyperAnimatedText(
                      'This is',
                      textStyle: TextStyle(
                        fontSize: 48.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    TyperAnimatedText(
                      'JH Talk',
                      textStyle: TextStyle(
                        fontSize: 48.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                // Text(
                //   '${_controller.value * 100}%',
                //   style: TextStyle(
                //     fontSize: 12,
                //   ),
                // ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              buttonColor: Colors.lightBlueAccent,
              buttonText: 'Log in',
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            RoundedButton(
              buttonColor: Colors.blueAccent,
              buttonText: 'Register',
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
            ),
          ],
        ),
      ),
    );
  }
}
