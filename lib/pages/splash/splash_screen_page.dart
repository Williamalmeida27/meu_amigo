import 'package:flutter/material.dart';
import 'package:meulucky/main.dart';
import 'package:meulucky/pages/home/my_home_page.dart';
import 'package:meulucky/services/repositories/cadastro_repository.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  var getDados = getIt<CadastroRepository>().obterDados();
  openSplash() {
    Future.delayed(Duration(seconds: 3), () {
      if (getDados != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => MyHomePage()));
      }
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
