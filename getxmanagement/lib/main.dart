import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxmanagement/screens/binding/binding_builder_put.dart';
import 'package:getxmanagement/screens/binding_screen.dart';
import 'package:getxmanagement/screens/dependencies_manage_screens/dependencies_manage_screen.dart';
import 'package:getxmanagement/screens/home_screen.dart';
import 'package:getxmanagement/screens/route_manage_screens/first_screen.dart';
import 'package:getxmanagement/screens/route_manage_screens/next_screen.dart';
import 'package:getxmanagement/screens/route_manage_screens/second_screen.dart';
import 'package:getxmanagement/screens/route_manage_screens/user_screen.dart';
import 'package:getxmanagement/screens/state_manage_screens/controller/count_controller_getx.dart';
import 'package:getxmanagement/screens/state_manage_screens/reactive_state_screen.dart';
import 'package:getxmanagement/screens/state_manage_screens/simple_state_screen.dart';

void main() {
  initService();
  runApp(MyApp());
}
void initService(){
  //최상단에서부터 Get.put을 진행해줌으로써 많은 페이지에서 진행할것임을 알려주고,
  //permanent:true 를 통해 어떤 페이지를 나가든 상관없이 이 컨트롤러는 사라지는것이 아니라
  //유지될것임을 명시해주는것이다.
  Get.put(Get.put(CountControllerGetX(),permanent: true));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(
          name: '/',
          page: () => HomeScreen(),
        ),
        GetPage(
          name: '/first',
          page: () => FirstScreen(),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: '/second',
          page: () => SecondScreen(),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: '/next',
          page: () => NextScreen(),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: '/user/:uid',
          page: () => UserScreen(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: '/state/simple',
          page: () => SimpleStateScreen(),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: '/state/reactive',
          page: () => ReactiveStateScreen(),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: '/dependencies_manage_screens',
          page: () => DependenciesManageScreen(),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: '/binding',
          page: () => BindingScreen(),
          binding: BindingBuilderPut(),
          transition: Transition.leftToRight,
        ),
      ],
    );
  }
}
