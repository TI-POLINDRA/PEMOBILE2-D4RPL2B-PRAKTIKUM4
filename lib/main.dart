import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pemobile2_d4rpl3b_praktikum4/screens/Onboarding3.dart';
import 'package:pemobile2_d4rpl3b_praktikum4/screens/login_screen.dart';
import 'package:pemobile2_d4rpl3b_praktikum4/screens/home_view_v3.dart';
import 'package:pemobile2_d4rpl3b_praktikum4/screens/verification_page.dart';
import 'package:pemobile2_d4rpl3b_praktikum4/screens/search_screen.dart';
import 'package:pemobile2_d4rpl3b_praktikum4/utils/router_check.dart';
import 'package:pemobile2_d4rpl3b_praktikum4/screens/profil_screen.dart'; 
import 'package:pemobile2_d4rpl3b_praktikum4/screens/personalProfiles.dart';
import 'package:pemobile2_d4rpl3b_praktikum4/screens/PaymentScreen_nomastercard.dart';
import 'package:pemobile2_d4rpl3b_praktikum4/screens/food_screen.dart';

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
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const RouterCheck(),
            '/login': (context) => LoginScreen(),
            '/homev3': (context) => const HomeViewV3(),
            '/profile': (context) => const ProfilScreen(),
            '/Onboarding': (context) => OnboardingScreen(),
            '/PersonalProfil': (context) => ProfileScreen(),
            '/verif': (context) => VerificationPage(),
            '/nomastercard': (context) => PaymentScreen(),
            '/payment': (context) => PaymentScreen(),
            '/search': (context) => const SearchScreen(),
            '/food': (context) => const FoodScreen(), 
          },
        );
      },
    );
  }
}
