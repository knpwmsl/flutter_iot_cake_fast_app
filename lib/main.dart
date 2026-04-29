import 'package:flutter/material.dart';
import 'package:flutter_iot_cake_fast_app/views/splash_screen_ui.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const FlutterCakeFastApp());
}

class FlutterCakeFastApp extends StatefulWidget {
  const FlutterCakeFastApp({super.key});

  @override
  State<FlutterCakeFastApp> createState() => _FlutterCakeFastAppState();
}

class _FlutterCakeFastAppState extends State<FlutterCakeFastApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreenUi(),
      theme: ThemeData(
        textTheme: GoogleFonts.kanitTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}
