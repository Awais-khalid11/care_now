import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
String uid = FirebaseAuth.instance.currentUser!.uid;
var userRef = FirebaseFirestore.instance.collection("users");
var historyRef = FirebaseFirestore.instance.collection("histories");
String timestampToDateFormat(int timestamp, String format) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
  return DateFormat(format).format(dateTime);
}
String appName = "Blood Community";

String placeholder_url =
    "https://phito.be/wp-content/uploads/2020/01/placeholder.png";
String userPlaceHolder =
    "https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png";