// ignore: unused_import
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class FCMService {
  static const String FCMAPI =
      "AAAA2e582Nc:APA91bHrPbpr5WnCDuUzFiMba5pdEoc3R5xIlZ5eCPcS9B5_WBO75JRuI6QnJkcEXlmvsvPiVAyooIUSNZyh1-m4sLbi1TNfmdD7bSmgZZuxCG_Jy__DkgZ1xkMgjP6XOJKAUJmJGSTQ";
  static String makePayLoadWithToken(String? token, Map<String, dynamic> data,
      Map<String, dynamic> notification) {
    return jsonEncode({
      'to': token,
      // 'to': token, is used for messaing only on one particular device
      'data': data,
      'notification': notification,
    });
  }

  static String makePayLoadWithTopic(String? topic, Map<String, dynamic> data,
      Map<String, dynamic> notification) {
    return jsonEncode({
      'topic': topic,
      // 'to': topic, is used for messaging more than one device or many device
      'data': data,
      'notification': notification,
    });
  }

  static Future<void> sendPushMessage(String? token, Map<String, dynamic> data,
      Map<String, dynamic> notification) async {
    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'key=$FCMAPI'
        },
        body: makePayLoadWithToken(token, data, notification),
      );
      print('FCM request for device sent!');
    } catch (e) {
      print(e);
    }
  }
}
