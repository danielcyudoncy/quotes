import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes/controllers/splash_controller.dart';
import 'package:quotes/utils/constant/images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController()); 

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.splashImage, height: 150, width: 150),
            const SizedBox(height: 20),
            const Text(
              'Daily Quotes',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
