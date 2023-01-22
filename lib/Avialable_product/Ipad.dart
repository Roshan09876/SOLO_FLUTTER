import 'package:flutter/material.dart';
import 'package:online_mobile/pages/home.dart';
import 'package:online_mobile/services/notification_service.dart';

class Iphone_12 extends StatelessWidget {
  const Iphone_12({super.key});

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
            height: 750,
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
                          " Powerful  Apple \n M2 Chip".toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 21),
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
                          "Launched in 2020 \n October 16".toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 21),
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
              padding: const EdgeInsets.only(bottom: 90),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 80),
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
                    "Ipad pro".toUpperCase(),
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
            top: 150,
            left: 60,
            child: Container(
              height: 300,
              width: 300,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Hero(
                  tag: "lol",
                  child: Image.asset(
                    "assets/images/Ipad.jpg",
                    scale: 1.1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
