import 'package:crud/firebase.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class Addemp extends StatefulWidget {
  const Addemp({super.key});

  @override
  State<Addemp> createState() => _AddempState();
}

class _AddempState extends State<Addemp> {
  final TextEditingController name = TextEditingController();
  final TextEditingController Age = TextEditingController();
  final TextEditingController location = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Add",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(width: 10),
            Text(
              "Employee",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 16,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(width: 2, color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(width: 2, color: Colors.blue),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(width: 2, color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Age",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: Age,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 16,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(width: 2, color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(width: 2, color: Colors.blue),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(width: 2, color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Location",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: location,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 16,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(width: 2, color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(width: 2, color: Colors.black),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(width: 2, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Firebaseservise().addemployee(
                      randomString(10),
                      name.text,
                      Age.text,
                      location.text,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(60, 60),
                    iconColor: Colors.black,
                    iconSize: 28,
                    backgroundColor: Colors.orange.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                  child: Text(
                    "Add",
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
