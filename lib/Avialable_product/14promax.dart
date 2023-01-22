import 'package:flutter/material.dart';
import 'package:online_mobile/firestore/database.dart';
import 'package:online_mobile/pages/home.dart';
import 'package:online_mobile/services/notification_service.dart';

class Iphone_14 extends StatefulWidget {
  const Iphone_14({super.key});

  @override
  State<Iphone_14> createState() => _Iphone_14State();
}

class _Iphone_14State extends State<Iphone_14> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: 1800,
            alignment: Alignment.bottomRight,
            color: Color(0xff123456),
          ),
          Container(
            height: 760,
            width: 5000,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(0)),
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 19, 185, 231),
                  Color.fromARGB(172, 122, 183, 183)
                ], begin: Alignment.centerRight, end: Alignment.centerLeft)),
            child: Padding(
              padding: const EdgeInsets.only(top: 480),
              child: Column(
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Row(
                      children: [
                        Icon(Icons.arrow_forward),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          " Most  Powerful  Apple \n A16  Bionic  Chip"
                              .toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Row(
                      children: [
                        Icon(Icons.arrow_forward),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Launched in 2022 \n September 17".toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 110),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Iphone 14 pro max".toUpperCase(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 30),
                  ),
                ],
              ),
            ),
            height: 280,
            decoration: BoxDecoration(
                color: Color(0xff123456),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                )),
          ),
          Positioned(
            top: 170,
            left: 6,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Hero(
                tag: "Roshan",
                child: Image.asset(
                  "assets/images/14-ip.jpg",
                  scale: 1.65,
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
