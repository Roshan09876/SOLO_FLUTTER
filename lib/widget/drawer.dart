// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_mobile/pages/changePassword.dart';

import 'package:online_mobile/pages/home.dart';
import 'package:online_mobile/pages/login.dart';
import 'package:online_mobile/pages/profile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color.fromARGB(255, 128, 83, 205),
        child: ListView(children: [
          Container(
            height: 220,
            child: DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.deepPurple),
                  accountName: Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      "Apple Store",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                      ),
                    ),
                  ),
                  accountEmail: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Softwarica_soloproject@apple.com",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/apple.avif"),
                    radius: 65,
                  ),
                )),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.white,
              size: 30,
            ),
            title: Material(
              color: Color.fromARGB(255, 128, 83, 205),
              child: InkWell(
                splashColor: Colors.blue,
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, a, b) => HomePage()),
                      (route) => false);
                },
                child: Text(
                  "Home",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: Colors.white,
              size: 30,
            ),
            title: Material(
              color: Color.fromARGB(255, 128, 83, 205),
              child: InkWell(
                splashColor: Colors.blue,
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => wow()));
                },
                child: Text(
                  "Profile",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.password,
              color: Colors.white,
              size: 30,
            ),
            title: Material(
              color: Color.fromARGB(255, 128, 83, 205),
              child: InkWell(
                splashColor: Colors.blue,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => password()));
                },
                child: Text(
                  "Change  Password",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.mark_email_read_outlined,
              color: Colors.white,
              size: 30,
            ),
            title: Material(
              color: Color.fromARGB(255, 128, 83, 205),
              child: InkWell(
                splashColor: Colors.blue,
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => wow()));
                },
                child: Text(
                  "Email Verify",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Colors.white,
              size: 30,
            ),
            title: Material(
              color: Color.fromARGB(255, 128, 83, 205),
              child: InkWell(
                splashColor: Colors.blue,
                onTap: () async => {
                  await FirebaseAuth.instance.signOut(),
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => login()))
                },
                child: Text(
                  "Log-Out".toUpperCase(),
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
