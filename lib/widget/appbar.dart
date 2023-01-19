import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:online_mobile/widget/Available.dart';
import 'package:online_mobile/widget/otherproducts.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 210,
            child: Stack(children: [
              Container(
                padding: EdgeInsets.only(left: 20, bottom: 50),
                height: 210 - 27,
                decoration: BoxDecoration(
                    color: Color(0xff123456),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(60),
                        bottomRight: Radius.circular(60))),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Text(
                        "Apple-Catalog",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 30),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 5,
                        ),
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/applehome.jpg"),
                          radius: 70,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(13),
                    height: 54,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 10,
                          color: Color(0xff123456),
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Color.fromARGB(255, 18, 5, 69),
                          size: 30,
                        ),
                        Container(
                          child: Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: "Search",
                                  hintStyle: TextStyle(
                                      color: Color(0xff123456),
                                      fontWeight: FontWeight.bold),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none),
                            ),
                          ),
                        ),
                        Material(
                          child: InkWell(
                            splashColor: Colors.blue,
                            onTap: (() {
                              FocusScope.of(context).unfocus();
                            }),
                            child: Icon(
                              Icons.highlight_off,
                              color: Colors.blue,
                              size: 30,
                            ),
                          ),
                        )
                      ],
                    ),
                  ))
            ]),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    height: 24,
                    child: Stack(children: [
                      Text(
                        "Only Images of Available Products",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color.fromARGB(255, 0, 0, 0)),
                      )
                    ]),
                  ),
                  SizedBox(
                    width: 90,
                  ),
                  ElevatedButton(
                      // splashColor: Colors.blue,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff123456),
                          padding: EdgeInsets.all(8),
                          minimumSize: Size(100, 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: () {},
                      child: Text(
                        "More",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ))
                ],
              ),
            ),
          ),
          Recomended(),
          SizedBox(
            height: 15,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 5),
              child: Row(
                children: [
                  Container(
                    height: 24,
                    child: Stack(children: [
                      Text(
                        "Apple-Products to Buy",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      )
                    ]),
                  ),
                  SizedBox(
                    width: 90,
                  ),
                  ElevatedButton(
                      // splashColor: Colors.blue,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff123456),
                          padding: EdgeInsets.all(8),
                          minimumSize: Size(100, 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: () {},
                      child: Text(
                        "More",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      )),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Other_products(),
          SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }
}
