import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:online_mobile/Avialable_product/11iphone.dart';
import 'package:online_mobile/Avialable_product/Air.dart';
import 'package:online_mobile/Avialable_product/Ipad.dart';
import 'package:online_mobile/Avialable_product/MAcbook-air.dart';
import 'package:online_mobile/Avialable_product/14promax.dart';

class Recomended extends StatelessWidget {
  const Recomended({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 80, right: 80),
        child: Row(
          children: [
            Container(
              // margin: EdgeInsets.only(left: 20, top: 40, bottom: 20 * 2.5),
              width: 130,
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Iphone_14()));
                },
                child: Column(children: [
                  Hero(
                      tag: "Roshan",
                      child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 167, 198, 228),
                              boxShadow: [
                                BoxShadow(blurRadius: 25, offset: Offset(5, 16))
                              ]),
                          height: 120,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              "assets/images/14-ip.jpg",
                              fit: BoxFit.cover,
                            ),
                          ))),
                  Container(
                    height: 70,
                    width: 300,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(199, 255, 255, 255),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 40,
                            color: Color(0xff123456).withOpacity(0.23),
                          ),
                        ]),
                    child: Column(children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "14pro Max\n".toUpperCase(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          TextSpan(
                            text: "A16 Bionic chip",
                            style:
                                TextStyle(color: Colors.red.withOpacity(0.95)),
                          ),
                        ]),
                      ),
                      Text(
                        "\$2200",
                        style: Theme.of(context).textTheme.button?.copyWith(
                              color: Color(0xff123456),
                            ),
                      )
                    ]),
                  ),
                ]),
              ),
            ),
            SizedBox(
              width: 40,
            ),
            Container(
              // margin: EdgeInsets.only(left: 20, top: 40, bottom: 20 * 2.5),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 219, 228, 238),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(blurRadius: 25, offset: Offset(5, 5))]),
              width: 140,

              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Iphone_13()));
                },
                child: Column(children: [
                  Container(
                    height: 130,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Hero(
                        tag: "wow",
                        child: Image.asset(
                          "assets/images/mac-2-pro.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 70,
                    width: 300,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(199, 255, 255, 255),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 40,
                            color: Color(0xff123456).withOpacity(0.23),
                          ),
                        ]),
                    child: Column(children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Macbook\n".toUpperCase(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          TextSpan(
                            text: "M1 powerful chip",
                            style:
                                TextStyle(color: Colors.red.withOpacity(0.95)),
                          ),
                        ]),
                      ),
                      Text(
                        "\$2500",
                        style: Theme.of(context).textTheme.button?.copyWith(
                              color: Color(0xff123456),
                            ),
                      )
                    ]),
                  ),
                ]),
              ),
            ),
            SizedBox(
              width: 40,
            ),
            Container(
              // margin: EdgeInsets.only(left: 20, top: 40, bottom: 20 * 2.5),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 167, 198, 228),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(blurRadius: 25, offset: Offset(5, 16))
                  ]),
              width: 130,
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Iphone_12()));
                },
                child: Column(children: [
                  Hero(
                      tag: "lol",
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset("assets/images/Ipad.jpg"))),
                  Container(
                    height: 70,
                    width: 300,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(199, 255, 255, 255),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 40,
                            color: Color(0xff123456).withOpacity(0.23),
                          ),
                        ]),
                    child: Column(children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Ipad\n".toUpperCase(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          TextSpan(
                            text: "New Model",
                            style:
                                TextStyle(color: Colors.red.withOpacity(0.95)),
                          ),
                        ]),
                      ),
                      Text(
                        "\$1700",
                        style: Theme.of(context).textTheme.button?.copyWith(
                              color: Color(0xff123456),
                            ),
                      )
                    ]),
                  )
                ]),
              ),
            ),
            SizedBox(
              width: 40,
            ),
            Container(
              // margin: EdgeInsets.only(left: 20, top: 40, bottom: 20 * 2.5),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 167, 198, 228),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(blurRadius: 25, offset: Offset(5, 16))
                  ]),
              width: 150,
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Iphone_11pro()));
                },
                child: Column(children: [
                  Container(
                      height: 130,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Hero(
                            tag: "Rohit",
                            child: Image.asset(
                              "assets/images/airpods-pro2.jpg",
                              fit: BoxFit.cover,
                            )),
                      )),
                  Container(
                    height: 70,
                    width: 300,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(199, 255, 255, 255),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 40,
                            color: Color(0xff123456).withOpacity(0.23),
                          ),
                        ]),
                    child: Column(children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Airpods\n".toUpperCase(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          TextSpan(
                            text: "2nd generation",
                            style:
                                TextStyle(color: Colors.red.withOpacity(0.95)),
                          ),
                        ]),
                      ),
                      Text(
                        "\$400",
                        style: Theme.of(context).textTheme.button?.copyWith(
                              color: Color(0xff123456),
                            ),
                      )
                    ]),
                  )
                ]),
              ),
            ),
            SizedBox(
              width: 40,
            ),
            Container(
              // margin: EdgeInsets.only(left: 20, top: 40, bottom: 20 * 2.5),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 167, 198, 228),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(blurRadius: 25, offset: Offset(5, 16))
                  ]),
              width: 120,
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Iphone_11()));
                },
                child: Column(children: [
                  Container(
                      height: 130,
                      width: 130,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Hero(
                              tag: "Kumar",
                              child: Image.asset(
                                "assets/images/m1-mac=pro.jpg",
                                fit: BoxFit.cover,
                              )))),
                  Container(
                    height: 70,
                    width: 300,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(199, 255, 255, 255),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 40,
                            color: Color(0xff123456).withOpacity(0.23),
                          ),
                        ]),
                    child: Column(children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Macbook pro\n".toUpperCase(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          TextSpan(
                            text: "M2  chip",
                            style:
                                TextStyle(color: Colors.red.withOpacity(0.95)),
                          ),
                        ]),
                      ),
                      Text(
                        "\$2600",
                        style: Theme.of(context).textTheme.button?.copyWith(
                              color: Color(0xff123456),
                            ),
                      )
                    ]),
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
