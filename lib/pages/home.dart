import 'package:badges/badges.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:online_mobile/services/notification_service.dart';
import 'package:online_mobile/widget/appbar.dart';
import 'package:online_mobile/widget/FLoatingbutton/cart.dart';
import 'package:online_mobile/widget/drawer.dart';
import 'package:online_mobile/widget/navigation.dart';
// ignore: unused_import
import 'package:online_mobile/widget/only_themes.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        print(message);
      }
    });
    FirebaseMessaging.instance.getToken().then((value) {
      String? token = value;
      print("fcm: " + token.toString());

      // I/flutter (0): fcm: eOIt5z4dSpm3Y7UESKUBEx...my8

      // it shoud print token like this in your debug console, this  is unique to each devices
    });

    // when app is in foreground
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        print(message.notification!.body);
        print(message.notification!.title);
      }

      NotificationService.displayFcm(
          notification: message.notification!, buildContext: context);
    });
    //when the app is in background but opened and user taps
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print(message);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: MyAppBar(),
      bottomNavigationBar: Navigation(),
      drawer: MyDrawer(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Color(0xff123456),
    );
  }
}
