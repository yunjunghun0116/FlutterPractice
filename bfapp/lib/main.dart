import 'package:app/models/mybf/issue_data.dart';
import 'package:app/screens/main/main_screen.dart';
import 'package:app/screens/mybf/pages/service_center_pages/customer_ask_page.dart';
import 'package:app/screens/mybf/pages/service_center_pages/disperse_page.dart';
import 'package:app/screens/mybf/pages/easypayment_page.dart';
import 'package:app/screens/mybf/pages/favorite_page.dart';
import 'package:app/screens/mybf/pages/modification_page.dart';
import 'package:app/screens/mybf/pages/service_center_pages/move_page.dart';
import 'package:app/screens/mybf/pages/order_page.dart';
import 'package:app/screens/mybf/pages/review_page.dart';
import 'package:app/screens/mybf/pages/service_center_pages/service_page.dart';
import 'package:app/screens/mybf/pages/settings_page.dart';
import 'package:app/screens/shopping/pages/shopping_detail_screen.dart';
import 'package:app/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            iconTheme: IconThemeData(
                color: Colors.black
            )
        ),
        scaffoldBackgroundColor: Colors.white
      ),
      home: SplashScreen(),
      initialRoute: '/',
      getPages: [
        GetPage(name:'/order', page: () => const OrderPage()), // 주문/배송조회
        GetPage(name: '/easypayment',page: () => const EasyPaymentPage()),//간편카드등록
        GetPage(name: '/ask', page: () => CustomerAskPage()),//1:1문의
        GetPage(name: '/service', page: () => ServicePage()),//서비스접수
        GetPage(name: '/move', page: () => MovePage()),//이전/설치접수
        GetPage(name: '/disperse', page: () => DispersePage()),//분해/조립접수
        GetPage(name:'/modification', page: () => const ModificationPage()),
        GetPage(name: '/review', page: () => const ReviewPage()),
        GetPage(name: '/favorite', page: () => const  FavoritePage()),
        GetPage(name: '/setting', page: () => const SettingsPage()),
        GetPage(name: '/shoppingDetailScreen', page: () => const ShoppingDetailScreen())
      ],
    );
  }
}
