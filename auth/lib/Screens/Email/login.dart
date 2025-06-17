import 'package:auth/Screens/Email/create.dart';
import 'package:auth/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

  void login() async {
    String email = emailcontroller.text.trim();
    String pass = passcontroller.text.trim();

    if (pass == "" || email == "") {
      print("Please fill all the Details");
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: pass);

        if (userCredential.user != null) {
          print("login done");
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => Homescreen()),
          );
        }
      } on FirebaseAuthException catch (ex) {
        print(ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign In",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 20),
            TextField(
              controller: emailcontroller,
              decoration: InputDecoration(
                label: Text("Email"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              controller: passcontroller,
              decoration: InputDecoration(
                label: Text("Password"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                login();
              },
              child: Text(
                "Confirm",
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(400, 50),
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 10),
            InkWell(
              child: Text(
                "Dont Have an Account ? Sign Up",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Createaccount()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
