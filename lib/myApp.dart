import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes/routes/routes.dart';

import 'app_bindings/app_bindings.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AppBindings(), 
      initialRoute: '/splash', 
      getPages: AppRoutes.routes,
    );
  }
}