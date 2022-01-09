library trello.globals;

import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/browser_client.dart';
import 'package:http/http.dart';

class CurrentWorkspace {
  static String title = '';
  static int id = -1;
}

class CurrentBoard {
  static String title = '';
  static int id = -1;
}

class Session {
  static BrowserClient client = BrowserClient()..withCredentials = true;
  static Map<String, String> baseHeaders = <String, String>{
    'Access-Control-Allow-Origin': 'https://localhost:8000',
    'Access-Control-Allow-Credentials': 'true',
    'Access-Control-Expose-Headers': 'true',
    'Content-Type': 'application/json; charset=UTF-8'
  };
  static String baseUrl = 'https://localhost:8000/';

  static Future<dynamic> post(String url, Map<String, String> body) async {
    Uri uri = Uri.parse(baseUrl + url);

    Response res = await client.post(
        uri,
        headers: baseHeaders,
        body: jsonEncode(body)
    );

    Map<String, dynamic> data = jsonDecode(res.body);
    return data;
  }

  static Future<dynamic> postFile(String url, Map<String, String> body, Uint8List bytes) {
    body.addAll({'file': base64Encode(bytes)});
    print(body);
    return post(url, body);
  }
}