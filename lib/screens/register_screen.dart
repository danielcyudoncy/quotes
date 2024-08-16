import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quotes/controllers/register_controller.dart';
import 'package:quotes/screens/login_screen.dart';



class RegisterScreen extends StatelessWidget {
   const RegisterScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final RegisterController registerController = Get.put(RegisterController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding:  const EdgeInsets.all(20.0),
          child: Obx(
            () => Form(
              key: registerController.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    controller: registerController.fullNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Full name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      label: const Text('Full Name'),
                      hintText: 'Enter Full Name',
                      hintStyle: const TextStyle(color: Colors.black26),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black12),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black12),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) => registerController.fullName.value = value,
                  ),
                  const SizedBox(height: 15.0),
                  TextFormField(
                    controller: registerController.emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      hintStyle: const TextStyle(color: Colors.black26),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black12),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => registerController.validateEmail(value),
                    onChanged: (value) => registerController.email.value = value,
                  ),
                  const SizedBox(height: 15.0),
                  TextFormField(
                    controller: registerController.passwordController,
                    obscureText: registerController.toggled.value,
                    obscuringCharacter: '*',
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 6) {
                        return 'Password must be at least 6 characters long!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: registerController.toggled.value
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                        onPressed: () {
                          registerController.toggled.toggle();
                        },
                      ),
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      hintStyle: const TextStyle(color: Colors.black26),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black12),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) => registerController.password.value = value,
                  ),
                  const SizedBox(height: 15.0),
                  TextFormField(
                    controller: registerController.confirmPasswordController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: registerController.toggled.value
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                        onPressed: () {
                          registerController.toggled.toggle();
                        },
                      ),
                      labelText: 'Confirm Password',
                      hintText: 'Re-enter your password',
                      hintStyle: const TextStyle(color: Colors.black26),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black12),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    obscureText: registerController.toggled.value,
                    obscuringCharacter: '*',
                    validator: (value) {
                      if (value != registerController.password.value) {
                        return "Passwords don't match";
                      }
                      return null;
                    },
                    onChanged: (value) => registerController.confirmPassword.value = value,
                  ),
                  const SizedBox(height: 15.0),
                  TextFormField(
                    controller: registerController.phoneNumberController,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      hintText: 'Enter your phone number',
                      hintStyle: const TextStyle(color: Colors.black26),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black12),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length != 11) {
                        return 'Phone number should be exactly 11 digits';
                      }
                      return null;
                    },
                    onChanged: (value) => registerController.phoneNumber.value = value,
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    children: [
                      Checkbox(
                        value: registerController.agreePersonalData.value,
                        onChanged: (value) {
                          registerController.agreePersonalData.value = value!;
                        },
                        activeColor: Colors.blue,
                      ),
                      const Text(
                        'I agree to the processing of ',
                        style: TextStyle(color: Colors.black54),
                      ),
                      const Text(
                        'Personal data',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25.0),
                  SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        registerController.register();
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(350, 50),
                        backgroundColor: const Color.fromARGB(255, 31, 44, 226),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: const Text('Register'),
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.7,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        child: Text(
                          'Register with',
                          style: TextStyle(color: Colors.black45),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.7,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25.0),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {},
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                           SvgPicture.asset('assets/images/icon-google.svg'),                      
                          const SizedBox(width: 15.0),
                          const Text(
                            'Google',
                            style: TextStyle(fontWeight: FontWeight.w800),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account? ',
                        style: TextStyle(color: Colors.black45),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const LoginScreen());
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
