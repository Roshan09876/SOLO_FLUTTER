import 'package:flutter/material.dart';
import 'package:online_mobile/pages/profile.dart';

class Navigation extends StatelessWidget {
  const Navigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: Color(0xff123456),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, -10),
                blurRadius: 45,
                color: Color(0xff123456).withOpacity(0.76))
          ]),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Icon(
                Icons.phone_iphone_outlined,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.apple_outlined,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.laptop_mac_outlined,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(
                width: 240,
              ),
              InkWell(
                onTap: (() {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => wow()));
                }),
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
