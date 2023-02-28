import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:online_mobile/pages/Phone_sign.dart';
import 'package:online_mobile/pages/home.dart';
import 'package:online_mobile/pages/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _obSecured = true;
  bool _Roshan = true;

  final _form = GlobalKey<FormState>();
  var email;
  var password;
  var confirmpassword;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    super.dispose();
  }

  registration() async {
    if (password == confirmpassword) {
      try {
        // ignore: unused_local_variable
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        print("Done");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.blue,
            content: Text(
              "Registered Successfull, Please Log-in",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            )));
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => login()));
      } on FirebaseAuthException catch (e) {
        if (e.code == "weak-password") {
          print("Password provided is too weak");
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                "Your Password is too weak",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              )));
        } else if (e.code == "email-already-in-use") {
          print("Account Already exists");
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                "This acoount is already exist",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              )));
        }
      }
    } else {
      print("Password and Confirm Password doesnot match");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            "Password and confirm Password doesnot match",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black),
          )));
    }
  }

  

  // ignore: unused_elementa
  _handleGoogleBtnClick() {
    _signInWithGoogle().then((user) {
      log('\nUser: ${user.user} ');
      log('\nUserAdditionalInfo: ${user.additionalUserInfo} ');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  Future<UserCredential> _signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create an Account"),
        backgroundColor: Color.fromARGB(255, 20, 101, 183),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 1000,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 72, 192, 194),
                  Color.fromARGB(172, 68, 117, 119)
                ], begin: Alignment.topRight, end: Alignment.bottomLeft),
              ),
            ),
            Form(
              key: _form,
              child: Container(
                height: 540,
                margin: EdgeInsets.only(left: 30, top: 180, bottom: 390),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1, color: Colors.blue),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        bottomLeft: Radius.circular(60))),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 180),
                        child: Text(
                          "Enter your email",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 20),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter your E-mail id",
                            labelText: "Email id",
                          ),
                          controller: emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email is required";
                            } else if (!value.contains("@")) {
                              return "@ is missing in e-mail";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 100),
                        child: Text(
                          "Enter your New-password",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xfff123456)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 20),
                        child: TextFormField(
                          obscureText: _obSecured,
                          decoration: InputDecoration(
                              hintText: "Enter Password",
                              labelText: "Password",
                              suffixIcon: IconButton(
                                icon: _obSecured
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _obSecured = !_obSecured;
                                  });
                                },
                              )),
                          controller: passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password is required";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 160),
                        child: Text(
                          "Confirm Password",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xfff123456)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 20),
                        child: TextFormField(
                          obscureText: _Roshan,
                          decoration: InputDecoration(
                              hintText: "Confirm Password",
                              labelText: "Confirm Password",
                              suffixIcon: IconButton(
                                icon: _obSecured
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _Roshan = !_Roshan;
                                  });
                                },
                              )),
                          controller: confirmpasswordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Same password is required";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(10),
                            minimumSize: Size(160, 40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18))),
                        onPressed: () {
                          if (_form.currentState!.validate()) {
                            setState(() {
                              email = emailController.text;
                              password = passwordController.text;
                              confirmpassword = confirmpasswordController.text;
                            });
                            registration();
                          }
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 74, 188, 213),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18))),
                        onPressed: () {
                          _handleGoogleBtnClick();
                        },
                        child: Container(
                          height: 40,
                          width: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            children: [
                              Image.network(
                                  "https://play-lh.googleusercontent.com/RZ5luCUwc5QtJP9xDn-ZCwEutT160GVyoh5K1eu4YJ5fD7v4LP5ptVdgR9mz4Hnr7A"),
                              SizedBox(
                                width: 18,
                              ),
                              Text(
                                "Continue with Google",
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(280, 32),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18))),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Phone()));
                        },
                        child: Text(
                          "Phone Sign is",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(50),
                        child: InkWell(
                          splashColor: Colors.blue,
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                PageRouteBuilder(
                                    pageBuilder: (context, a, b) => login(),
                                    transitionDuration: Duration(seconds: 0)),
                                (route) => false);
                          },
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 30),
                                child: Text(
                                  "Already have an account?",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.blue),
                                ),
                              ),
                              Text(
                                "     Login",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19,
                                    color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Material(
                      //   child: InkWell(
                      //     splashColor: Colors.blue,
                      //     onTap: () {
                      //       _loginWithFacebook();
                      //     },
                      //     child: Container(
                      //       height: 60,
                      //       margin: EdgeInsets.only(left: 20, top: 14),
                      //       decoration: BoxDecoration(
                      //           border: Border.all(width: 2, color: Colors.red),
                      //           borderRadius: BorderRadius.circular(12)),
                      //       child: Container(
                      //         margin: EdgeInsets.only(left: 30),
                      //         child: Row(
                      //           children: [
                      //             CircleAvatar(
                      //               backgroundImage: NetworkImage(
                      //                   "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Facebook_icon.svg/2048px-Facebook_icon.svg.png"),
                      //               radius: 24,
                      //             ),
                      //             SizedBox(
                      //               width: 12,
                      //             ),
                      //             Text(
                      //               "Log in with Facebook",
                      //               style: TextStyle(fontSize: 18),
                      //             )
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // )
                    ]),
                  ),
                ),
              ),
            ),
            Positioned(
                top: 10,
                left: 260,
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/apple.avif"),
                  radius: 70,
                ))
          ],
        ),
      ),
    );
  }
}
