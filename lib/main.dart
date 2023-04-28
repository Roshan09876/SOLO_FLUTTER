// ignore_for_file: unused_import

import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:online_mobile/Avialable_product/14promax.dart';
import 'package:online_mobile/firestore/database.dart';

import 'package:online_mobile/pages/home.dart';
import 'package:online_mobile/pages/login.dart';
import 'package:online_mobile/services/notification_service.dart';
import 'package:online_mobile/widget/FLoatingbutton/cart_provider.dart';
import 'package:online_mobile/widget/drawer.dart';
import 'package:online_mobile/widget/only_themes.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  NotificationService.initialize();
  runApp(Apple());
}

class Apple extends StatefulWidget {
  const Apple({super.key});

  @override
  State<Apple> createState() => _AppleState();
}

class _AppleState extends State<Apple> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: Builder(builder: (BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),   
          themeMode: ThemeMode.light,
          theme: MyTheme.lightTheme(context),
          darkTheme: MyTheme.darkTheme(context),
        );
      }),
    );
  }
}
