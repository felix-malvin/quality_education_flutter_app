import 'package:flutter/material.dart';
import 'package:quality_education_app/pages/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Splash Screen Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Mukta'),
      home: SplashScreen(),
    );
  }
}
