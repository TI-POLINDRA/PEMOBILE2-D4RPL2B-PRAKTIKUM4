import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pemobile2_d4rpl3b_praktikum4/screens/home_v1.dart';
import 'package:pemobile2_d4rpl3b_praktikum4/screens/login_screen.dart';
import 'package:pemobile2_d4rpl3b_praktikum4/utils/router_check.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          initialRoute: '/homev1',
          routes: {
            '/': (context) => const RouterCheck(),
            '/login': (context) => const LoginScreen(),
            '/homev1': (context) => const HomeScreen(),
          },
        );
      },
    );
  }
}
