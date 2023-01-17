import 'package:flutter/material.dart';

class Phone extends StatefulWidget {
  const Phone({super.key});

  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: 1000,
          width: 2000,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 72, 192, 194),
              Color.fromARGB(172, 68, 117, 119)
            ], begin: Alignment.topRight, end: Alignment.bottomLeft),
          ),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, top: 190),
              child: TextFormField(
                  decoration: InputDecoration(
                hintText: "Phone Number",
                labelText: 'Enter your Phone Number',
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              )),
            ),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Send OTP",
                  style: TextStyle(fontSize: 19, color: Colors.black),
                ))
          ])),
    );
  }
}
