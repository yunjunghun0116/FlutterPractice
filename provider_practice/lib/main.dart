import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //provider를 적용하기위해서는 가장 상위수준에 provider를 넣어주어야함
    //Provider<Type>을 이용 -> String 등과 같아도 상관없음
    return ChangeNotifierProvider<Data>(
      //provider를 이용해서 무엇을 하위 위젯들에게 전달해줄것인지를
      //create을 통해 작성한다.
      create: (context) => Data(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: MyText(),
          ),
          body: Level1(),
        ),
      ),
    );
  }
}

class Level1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('${Provider.of<Data>(context).data}님 안녕하세요'),
          Level2(),
        ],
      ),
    );
  }
}

class Level2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTextField(),
        Level3(),
      ],
    );
  }
}

class Level3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<Data>(context,listen: false).data);
  }
}

class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<Data>(context,listen: false).data);
  }
}

class MyTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (newText) {
        context.read<Data>().changeString(newText);
        print('now text is : ${Provider.of<Data>(context,listen: false).data}');
      },
    );
  }
}

class Data with ChangeNotifier {
  String data = 'Some data';

  void changeString(String newString) {
    data = newString;
    //TODO what is this notifyListeners
    notifyListeners();
  }
}
