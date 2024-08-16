import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quotes/firebase_options.dart';
import 'package:quotes/myApp.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

