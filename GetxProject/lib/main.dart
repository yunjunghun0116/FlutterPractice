import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/controllers/user_controller.dart';
import 'package:getx_project/screens/arguments/arguments_screen.dart';
import 'package:getx_project/screens/home/home_screen.dart';
import 'package:getx_project/screens/parameters/parameter_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   initialRoute: '/',
    //   routes: {
    //     '/': (context)=>HomeScreen(),
    //     '/arguments':(context)=>ArgumentsScreen(),
    //   },
    // );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: BindingsBuilder.put(()=>UserController()),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const HomeScreen()),
        GetPage(name: '/arguments', page: () => const ArgumentsScreen()),
        GetPage(name: '/parameters/:id', page: () => const ParameterScreen()),
      ],
    );
  }
}
