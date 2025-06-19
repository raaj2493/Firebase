// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'emp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'addemp.dart';

class Firebaseservise {
  final CollectionReference empcollection = FirebaseFirestore.instance
      .collection("employee");

  // Create
  Future<void> addemployee(
    String id,
    String name,
    String Age,
    String location,
  ) async {
    await empcollection.add({"Name": name, "Age": Age, "Location": location});
  }

  // READ
  Stream<QuerySnapshot> getEmployees() {
    return empcollection.snapshots();
  }

  //UPDATE
  Future<void> updatemployee(
    String id,
    String name,
    String age,
    String location,
  ) async {
    await empcollection.doc(id).update({
      "Name": name,
      "Age": age,
      "Location": location,
    });
  }

  // DELETE
  Future<void> deletemployee(String id) async {
    await empcollection.doc(id).delete();
  }
}
