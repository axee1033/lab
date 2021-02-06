import 'dart:async';

import 'package:flutter/material.dart';
import 'package:xlab/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash-screen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 8),
        () => Navigator.pushReplacementNamed(context, HomeScreen.routeName));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 2,
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(MediaQuery.of(context).size.width / 5),
            image: DecorationImage(
              image: AssetImage('assets/images/logo.jfif'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
