import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_mobile/pages/home.dart';
import 'package:online_mobile/pages/login.dart';

class wow extends StatefulWidget {
  const wow({super.key});

  @override
  State<wow> createState() => _wowState();
}

class _wowState extends State<wow> {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final email = FirebaseAuth.instance.currentUser!.email;
  final creationTime = FirebaseAuth.instance.currentUser!.metadata.creationTime;

  User? user = FirebaseAuth.instance.currentUser;
  verifyEmail() async {
    if (user != null && user!.emailVerified) {
      await user!.sendEmailVerification();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.deepOrange,
          content: Text(
            "Varification Email has been sent",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          color: Color(0xff123456),
        ),
        Container(
          height: 740,
          width: 600,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(40))),
          child: Padding(
            padding: const EdgeInsets.only(top: 480.0),
            child: Column(children: [
              Text(
                "User Id:- $uid",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Row(
                  children: [
                    Text(
                      "Email:- ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "    $email",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              user != null && user!.emailVerified
                  ? Text(
                      "Account Verified",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )
                  : TextButton(
                      onPressed: (() => {verifyEmail()}),
                      child: Text(
                        "Verify Email",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )
                      ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Row(
                  children: [
                    Text(
                      "Created:-  ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "$creationTime",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
        Container(
          height: 410,
          width: 450,
          decoration: BoxDecoration(
              color: Color(0xff123456),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(0))),
          child: Column(
            children: [
              Padding(padding: const EdgeInsets.only(left: 20, top: 35)),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 35,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Profile",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                padding: EdgeInsets.only(top: 200, right: 180),
                child: Text(
                  "Apple Store",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 0),
                child: Text(
                  "SoloProject  in flutter@apple.com",
                  style: TextStyle(
                      color: Color.fromARGB(255, 206, 202, 202),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 60,
          left: 220,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/apple.avif"),
              radius: 100,
            ),
          ),
        ),
        Positioned(
            top: 760,
            left: 270,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(10),
                    minimumSize: Size(120, 50),
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                onPressed: () async => {
                      await FirebaseAuth.instance.signOut(),
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => login()))
                    },
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      size: 25,
                      color: Colors.white,
                    ),
                    Text(
                      "Log-out",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    )
                  ],
                )))
      ]),
    );
  }
}
