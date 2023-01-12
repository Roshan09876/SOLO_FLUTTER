import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:online_mobile/services/notification_service.dart';

class Fire extends StatefulWidget {
  const Fire({super.key});

  @override
  State<Fire> createState() => _FireState();
}

class _FireState extends State<Fire> {
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
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              NotificationService.display("This is title", "This is body",
                  "This is Extra data", context);
            },
            icon: Icon(Icons.notification_important))
      ]),
    );
  }
}
