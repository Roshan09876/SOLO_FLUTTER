import 'package:flutter/material.dart';
import 'package:online_mobile/pages/home.dart';
import 'package:online_mobile/services/notification_service.dart';

class Iphone_11 extends StatelessWidget {
  const Iphone_11({super.key});

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
              padding: const EdgeInsets.only(top: 470),
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
                          "Powerful  Apple \n M2 Chip".toUpperCase(),
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
                          width: 21,
                        ),
                        Text(
                          "Launched in 2019 ".toUpperCase(),
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
                    "MAcbook Pro".toUpperCase(),
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
            top: 190,
            left: 16,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Hero(
                  tag: "Kumar",
                  child: Image.network(
                    "https://assets-prd.ignimgs.com/2022/06/17/applemacbookprom2-1655488149423.jpg",
                    fit: BoxFit.cover,
                    scale: 3.2,
                  )),
            ),
          ),
        ],
      ),
    ));
  }
}
