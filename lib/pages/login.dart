import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:online_mobile/pages/forgot_password.dart';
import 'package:online_mobile/pages/home.dart';
import 'package:online_mobile/pages/signup.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool _obSecured = true;
  String name = "";
  bool loginbutton = false;

  // ignore: unused_field
  final _formkey = GlobalKey<FormState>();
  var email = "";
  var password = "";

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
      await Future.delayed(Duration(seconds: 1));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.blue,
          content: Text(
            "Welcome to Online Apple-Mobile Application",
            style: TextStyle(fontSize: 20),
          )));
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("Username is incorrect or not-found");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              "Invalid e-mail for login",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 19),
            )));
      } else if (e.code == 'wrong-password') {
        print("Password is wrong");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text("Password is incorrect",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 19))));
      }
    }
  }

  go_to_homepage(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        email = emailController.text;
        password = passwordController.text;
      });
      userLogin();
      await Future.delayed(Duration(seconds: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Stack(children: [
            Container(
              height: 1000,
              width: 5000,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color.fromARGB(255, 19, 185, 231),
                Color.fromARGB(172, 122, 183, 183)
              ], begin: Alignment.centerRight, end: Alignment.centerLeft)),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 370, left: 40, bottom: 10, right: 4),
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 235, 247, 248),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(10))),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 15, right: 10),
                      child: Text("Welcome $name",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              color: Color.fromARGB(255, 2, 82, 100))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 210, top: 30),
                      child: Text(
                        "E-mail",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                            color: Colors.blue),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 70),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Enter your email", labelText: "Email"),
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email is required";
                          } else if (!value.contains("@")) {
                            return "Please Enter valid email (@) missing";
                          } else {
                            return null;
                          }
                        },
                        onChanged: ((value) {
                          name = value;
                          setState(() {});
                        }),
                      ),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 210),
                      child: Text(
                        "Password",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                            color: Colors.blue),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 70),
                      child: TextFormField(
                        obscureText: _obSecured,
                        decoration: InputDecoration(
                            hintText: "Enter your password",
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
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 180),
                      child: Material(
                        child: InkWell(
                          splashColor: Colors.red,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Forgot()));
                          },
                          child: Text(
                            "Forgot Password ?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.pink,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Material(
                      color: Color.fromARGB(255, 6, 238, 255),
                      borderRadius:
                          BorderRadius.circular(loginbutton ? 90 : 10),
                      child: InkWell(
                        splashColor: Color.fromARGB(255, 13, 130, 184),
                        onTap: () => go_to_homepage(context),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          alignment: Alignment.center,
                          height: 45,
                          width: loginbutton ? 80 : 230,
                          child: loginbutton
                              ? Icon(
                                  Icons.done_outline_rounded,
                                  size: 40,
                                  color: Colors.black,
                                )
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23,
                                      color: Color.fromARGB(255, 0, 24, 24)),
                                ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70),
                      child: Material(
                        child: InkWell(
                          splashColor: Colors.blue,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()));
                          },
                          child: Row(
                            children: [
                              Text("Do you have an account?",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              Text(
                                "   Sign Up",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 5),
              height: 350,
              width: 500,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 14, 2, 47),
                    Color.fromARGB(173, 32, 209, 215)
                  ], begin: Alignment.topRight, end: Alignment.bottomLeft),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(120),
                      bottomRight: Radius.circular(30))),
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 40, left: 180),
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/apple.avif"),
                        radius: 80,
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 50, right: 40),
                    child: Text(
                      "Apple-Store",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 45,
                          color: Colors.white),
                    ),
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
