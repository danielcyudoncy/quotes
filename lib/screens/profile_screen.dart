import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quotes/controllers/auth_controller.dart';
import 'package:quotes/controllers/profile_controller.dart';
import 'package:quotes/utils/constant/colors.dart';
import 'package:quotes/utils/constant/sizes.dart'; 


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController profileController = Get.find<ProfileController>(); 

  final AuthController authController = Get.find<AuthController>();

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      profileController.pickImage(image.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,  
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              authController.logout();  
              Get.offAllNamed('/onboarding');  
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Profile',
                  style: TextStyle(fontSize: AppSizes.fontSizeLg, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: Obx(
                  () => GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: profileController.profileImage.value.isNotEmpty
                          ? FileImage(File(profileController.profileImage.value))
                          : const AssetImage('assets/default_profile.png') as ImageProvider, 
                      child: profileController.profileImage.value.isEmpty
                          ? const Icon(Icons.camera_alt, size: 50, color: primaryColor)
                          : null,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Obx(
                () => TextFormField(
                  initialValue: profileController.fullName.value,
                  decoration: const InputDecoration(
                    labelText: 'Full Name',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    profileController.fullName.value = value;
                  },
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () => TextFormField(
                  initialValue: profileController.email.value,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    profileController.email.value = value;
                  },
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  profileController.updateProfile();
                  Get.back(); 
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(350, 50),
                  backgroundColor: const Color.fromARGB(255, 31, 44, 226),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: const Text('Update Profile'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  authController.logout();  
                  Get.offAllNamed('/onboarding');  
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(350, 50),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: const Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
