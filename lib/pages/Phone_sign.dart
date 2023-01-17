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
          child: Column(children: [])),
    );
  }
}
