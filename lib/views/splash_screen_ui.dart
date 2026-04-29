import 'package:flutter/material.dart';
import 'package:flutter_iot_cake_fast_app/views/cake_shop_list_ui.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({super.key});

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true);

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const CakeShopListUi(),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_welcome.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 100),
              const Text(
                'CAKEYUMMY',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3E2723),
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'รสชาติที่ใช่กับร้านโปรดของคุณ',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5D4037),
                ),
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ตัวที่ 1: เค้ก
                  ScaleTransition(
                    scale: Tween(begin: 0.8, end: 1.1).animate(
                      CurvedAnimation(
                          parent: _controller, curve: Curves.easeInOut),
                    ),
                    child: Image.asset(
                      'assets/images/cake.png',
                      width: 45,
                      height: 45,
                    ),
                  ),
                  const SizedBox(width: 10),

                  ScaleTransition(
                    scale: Tween(begin: 0.8, end: 1.1).animate(
                      CurvedAnimation(
                          parent: _controller, curve: Curves.easeInOut),
                    ),
                    child: Image.asset(
                      'assets/images/strawberry.png',
                      width: 45,
                      height: 45,
                    ),
                  ),
                  const SizedBox(width: 10),

                  ScaleTransition(
                    scale: Tween(begin: 0.8, end: 1.1).animate(
                      CurvedAnimation(
                          parent: _controller, curve: Curves.easeInOut),
                    ),
                    child: Image.asset(
                      'assets/images/croissant.png',
                      width: 45,
                      height: 45,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
