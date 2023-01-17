import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Phone extends StatefulWidget {
  const Phone({super.key});

  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xff123456), title: Text("Phone Number OTP")),
      body: Container(
          height: 1000,
          width: 2000,
          decoration: BoxDecoration(
            // color: Color.fromARGB(26, 134, 125, 125),
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 113, 244, 246),
              Color.fromARGB(172, 187, 221, 222)
            ], begin: Alignment.topRight, end: Alignment.bottomLeft),
          ),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(left: 200, top: 20),
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/apple.avif"),
                radius: 70,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, top: 60),
              child: TextFormField(
                  decoration: InputDecoration(
                hintText: "Phone Number",
                labelText: 'Enter your Phone Number',
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
              child: TextFormField(
                  decoration: InputDecoration(
                hintText: "OTP",
                labelText: 'Enter your OTP code',
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              )),
            ),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: Size(220, 35)),
                onPressed: () {
                  verifyNumber();
                },
                child: Text(
                  "Send OTP",
                  style: TextStyle(fontSize: 19, color: Colors.black),
                ))
          ])),
    );
  }

  void verifyNumber() {
    auth.verifyPhoneNumber(
        phoneNumber: phoneController.text,
        verificationCompleted: (PhoneAuthCredential credential) {
          auth
              .signInWithCredential(credential)
              .then((value) => print("You are logged in Succesfully"));
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(exception.message);
        },
        codeSent: (String verificationID, int? resendToken) {},
        codeAutoRetrievalTimeout: (String verificationId) {});
  }
}
