import 'package:auth/Screens/Email/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  void logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => Loginscreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text(
          "Home",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            onPressed: () {
              logout();
            },
            icon: Icon(Icons.exit_to_app, size: 32),
          ),
        ],
      ),
      body: Center(
        child: Text(
          "Welcome !",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
