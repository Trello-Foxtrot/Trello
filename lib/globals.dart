library trello.globals;

import 'dart:convert';

import 'package:http/browser_client.dart';
import 'package:http/http.dart';

class CurrentWorkspace {
  static String title = '';
  static int id = -1;
}

class Session {
  static BrowserClient client = BrowserClient()..withCredentials = true;
  static Map<String, String> baseHeaders = <String, String>{
    'Access-Control-Allow-Origin': 'https://localhost:8000',
    'Access-Control-Allow-Credentials': 'true',
    'Access-Control-Expose-Headers': 'true',
    'Content-Type': 'application/json; charset=UTF-8',
  };
  static String baseUrl = 'https://localhost:8000/';

  static post(String url, Map<String, String> body) async {
    Uri uri = Uri.parse(baseUrl + url);
    Response res = await client.post(
        uri,
        headers: baseHeaders,
        body: jsonEncode(body)
    );
    Map<String, String> data = jsonDecode(res.body);
    return data;
  }
}