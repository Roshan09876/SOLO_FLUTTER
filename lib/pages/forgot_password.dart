

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_mobile/pages/login.dart';
import 'package:online_mobile/pages/signup.dart';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  final _formkey = GlobalKey<FormState>();
  var email = "";

  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
  //To reset you password you have to signup with real gmailaccount

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            "Reset Password has been sent to you e-mail",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
          )));
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("There is no any user for this email");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              "There is no any user for this email",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reset Password",
          style: TextStyle(color: Colors.red),
        ),
        backgroundColor: Color(0xfff123456),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 123, 82, 234),
            Color.fromARGB(172, 7, 56, 58)
          ], begin: Alignment.topRight, end: Alignment.bottomLeft),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(children: [
            Container(
              child: Form(
                key: _formkey,
                child: Text(
                  "Reset  Link  will  be  sent  to  your  email  id!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 27,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Enter your  e-mail",
                  hintText: "Email",
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder()),
              controller: emailController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter E-mail";
                } else if (!value.contains("@")) {
                  return "E-mail must contain (@) ";
                }
                return null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 90),
              child: Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(10),
                        // minimumSize: Size(140, 45),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7))),
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        setState(() {
                          email = emailController.text;
                        });
                        resetPassword();
                      }
                    },
                    child: Text(
                      "Send Email",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => login()));
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            InkWell(
              splashColor: Colors.blue,
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignUp()));
              },
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 80),
                    child: Text(
                      "Don't have an account?",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ),
                  Text(
                    "     Signup",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
