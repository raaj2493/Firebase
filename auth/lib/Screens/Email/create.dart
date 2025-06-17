import 'package:auth/Screens/Email/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Createaccount extends StatefulWidget {
  const Createaccount({super.key});

  @override
  State<Createaccount> createState() => _CreateaccountState();
}

class _CreateaccountState extends State<Createaccount> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  TextEditingController cpasscontroller = TextEditingController();

  void createaccount() async {
    String email = emailcontroller.text.toString();
    String pass = passcontroller.text.trim();
    String cpass = cpasscontroller.text.trim();

    if (cpass == "" || pass == "" || email == "") {
      print("Please fill all the Details");
    } else if (cpass != pass) {
      print("Password do not match");
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: pass);
        print("User Created");
        if (userCredential.user != null) {
          Navigator.pop(context);
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
              "Sign Up",
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
            TextField(
              obscureText: true,
              controller: cpasscontroller,
              decoration: InputDecoration(
                label: Text("Change Password"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                createaccount();
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
                "Alredy Have an Account ? Sign In",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Loginscreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
