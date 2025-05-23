import 'package:flutter/material.dart';
import 'package:nectar_groceries_app/pages/category_products.dart';
import 'package:nectar_groceries_app/pages/explore.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/services.dart';
import 'package:nectar_groceries_app/pages/home_screen.dart';
import 'package:nectar_groceries_app/pages/login.dart';
import 'package:nectar_groceries_app/pages/navigation.dart';
import 'package:nectar_groceries_app/pages/number.dart';
import 'package:nectar_groceries_app/pages/onboarding.dart';
// import 'package:nectar_groceries_app/pages/search.dart';
import 'package:nectar_groceries_app/pages/select_location.dart';
import 'package:nectar_groceries_app/pages/signin.dart';
import 'package:nectar_groceries_app/pages/signup.dart';
import 'package:nectar_groceries_app/pages/verification.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Gilroy",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(backgroundColor: Colors.white),
        bottomAppBarTheme: BottomAppBarTheme(color: Colors.white),
      ),
      home: const Onboarding(),
      routes: {
        "/signin": (context) => const Signin(),
        "/number": (context) => Number(),
        "/verification": (context) => Verification(),
        "/select_location": (context) => SelectLocation(),
        "/login": (context) => Login(),
        "/signup": (context) => Signup(),
        "/home": (context) => HomeScreen(),
        "/explore": (context) => Explore(),
        "/navigation": (context) => Navigation(),
        // "/search": (context) => Search(),
      },
    );
  }
}
