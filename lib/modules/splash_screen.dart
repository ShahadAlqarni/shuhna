import 'package:flutter/material.dart';
import '../modules/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    //after 5 sec show the next page
    Future.delayed(const Duration(seconds: 5), () {
      //open the next page
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Onboarding()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //to improve screen
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          height: 240,
          width: 240,
        ),
      ),
    );
  }
}
