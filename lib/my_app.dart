import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:meulucky/pages/splash/splash_screen_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('az');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(),
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(211, 52, 166, 76)),
      ),
      home: const SplashScreenPage(),
    );
  }
}
