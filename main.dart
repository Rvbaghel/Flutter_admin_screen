import 'package:flutter/material.dart';
import 'adminlogin.dart';  // Import the file where AdminLogin is defined
import 'signupadmin.dart';
import 'splash_screen.dart';
import 'ootpemployee.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/WelcomeScreen': (BuildContext context) => SplashScreen(),
    },
  ));
}