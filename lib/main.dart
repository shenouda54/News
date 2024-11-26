import 'package:flutter/material.dart';
import 'package:news/my_theme_data.dart';
import 'package:news/screens/home_screen.dart';
import 'package:news/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      initialRoute: SplashScreen.routeName,
      theme: MyThemeData.LightTheme,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
      },
    );
  }
}
