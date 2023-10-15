import 'package:flutter/material.dart';
import 'package:meulucky/pages/my_home_page.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  openSplash() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => MyHomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    openSplash();
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.lightGreen, Colors.green])),
      ),
    ));
  }
}
