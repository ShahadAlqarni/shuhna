import 'package:flutter/material.dart';
import '../modules/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    //after 7 sec show the next page
    Future.delayed(const Duration(seconds: 7), () {
      //open the next page
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //to improve screen
    return Scaffold(
      body: Center(
        child: Image.asset(
          'images/logo.png',
          height: 240,
          width: 240,
        ),
      ),
    );
  }
}
