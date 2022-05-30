import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:record_moment/providers/user_provider.dart';
import 'package:record_moment/screens/main_screen.dart';
import 'package:record_moment/screens/start_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: ChangeNotifierProvider<UserProvider>(
          create: (_) => UserProvider(),
          child: const MainScreen()
      ),
    );
  }
}
