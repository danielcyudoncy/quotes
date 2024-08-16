import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes/controllers/onboarding_controller.dart';
import 'package:quotes/utils/constant/images.dart';


class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final OnboardingController controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.splashImage, height: 150, width: 150),
            const SizedBox(height: 50.0),
            RichText(
              text: const TextSpan(
                text: '!We welcome you to',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 28,
                    color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: ' Quotes',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.blue)),
                  TextSpan(text: '!'),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'We give you all the quotes \n in one place',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 90),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    
                    controller.navigateToLogin(); 
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(350, 50),
                    backgroundColor: const Color.fromARGB(255, 31, 44, 226),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text("Get Started"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
