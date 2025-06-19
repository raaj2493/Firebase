import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/addemp.dart';
import 'package:crud/firebase.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Stream? employeestream;

  getonload() {
    employeestream = Firebaseservise().getEmployees();
    setState(() {});
  }

  @override
  void initState() {
    getonload();
    super.initState();
  }

  Widget employedetail() {
    return StreamBuilder(
      stream: employeestream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return Column(
                    children: [
                      Material(
                        borderRadius: BorderRadius.circular(20),
                        elevation: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(20),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Name : ${ds['Name']}",
                                        style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      InkWell(
                                        child: Icon(
                                          Icons.edit,
                                          color: Colors.orange,
                                        ),
                                        onTap: () {
                                          Firebaseservise().updatemployee(
                                            ds.id,
                                            ds['name'],
                                            ds['age'],
                                            ds['location'],
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Age : ${ds['Age'].toString()}",
                                        style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.orange,
                                        ),
                                      ),
                                      InkWell(
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.grey,
                                        ),
                                        onTap: () {
                                          Firebaseservise().deletemployee(
                                            ds.id,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "Location : ${ds['Location']}",
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //  SizedBox(height: 30),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  );
                },
              )
            : Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => Addemp()));
        },
        style: ElevatedButton.styleFrom(
          minimumSize: Size(60, 60),
          iconColor: Colors.black,
          iconSize: 28,
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17),
          ),
        ),
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Flutter",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Text(
              "Firebase",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: employedetail(),
      ),
    );
  }
}
