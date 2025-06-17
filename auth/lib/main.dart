import 'package:auth/Screens/Email/create.dart';
import 'package:auth/Screens/Email/login.dart';
import 'package:auth/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
          (FirebaseAuth.instance.currentUser != null)
              ? Homescreen()
              : Loginscreen(),
    );
  }
}
