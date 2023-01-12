import 'package:flutter/material.dart';

import 'package:online_mobile/List_products/list_Items.dart';

class Other_products extends StatelessWidget {
  const Other_products({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 60),
        child: Row(
          children: [
            InkWell(
              splashColor: Colors.blue,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => list_laptop()));
              },
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 120,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Color(0xff123456),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 70,
                              color: Color(0xff123456).withOpacity(0.24))
                        ],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Text(
                      "I-Phone's".toUpperCase(),
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                      height: 130,
                      child: Image.asset("assets/images/14-ip.jpg")),
                ],
              ),
            ),
            SizedBox(
              width: 40,
            ),
            InkWell(
              splashColor: Colors.blue,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => list_laptop()));
              },
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 130,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Color(0xff123456),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 70,
                              color: Color(0xff123456).withOpacity(0.24))
                        ],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Text(
                      "L a p t o p s".toUpperCase(),
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    height: 130,
                    child: Hero(
                        tag: "hero",
                        child: Image.asset("assets/images/m1.png")),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 40,
            ),
            InkWell(
              splashColor: Colors.blue,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => list_laptop()));
              },
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 120,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Color(0xff123456),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 70,
                              color: Color(0xff123456).withOpacity(0.24))
                        ],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Text(
                      "Airpods".toUpperCase(),
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      height: 130,
                      child: Image.asset("assets/images/airpods.jpg"),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 30,
            ),
            InkWell(
              splashColor: Colors.blue,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => list_laptop()));
              },
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 120,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Color(0xff123456),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 70,
                              color: Color(0xff123456).withOpacity(0.24))
                        ],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Text(
                      "I - pad's".toUpperCase(),
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      height: 130,
                      child: Image.asset("assets/images/Ipad.jpg"),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
