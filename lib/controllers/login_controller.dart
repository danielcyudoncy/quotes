import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quotes/screens/home_screen.dart';

class LogInController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var toggled = true.obs;
  var agreePersonalData = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void submit() async {
    if (formKey.currentState!.validate()) {
      try {
        // Sign in the user
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        // Optional: Check if userCredential is not null
        if (userCredential.user != null) {
          // You can use userCredential.user to get user info if needed
          // For example: userCredential.user!.email
          
          // Navigate to the home screen
          Get.off(() => HomeScreen());  // Use Get.off() to replace current route
        } else {
          Get.snackbar(
            'Login Failed',
            'User credential is null.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      } catch (e) {
        // Handle authentication errors
        Get.snackbar(
          'Login Failed',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }
}
