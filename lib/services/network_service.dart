import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  Future<Map> get(String url) async {
    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    return json.decode(response.body);
  }

  Future<Map> post(String url, Map data) async {
    debugPrint("url: $url");
    Uri uri = Uri.parse(url);
    debugPrint(uri.toString());
    final response = await http.post(uri, body: json.encode(data), headers: {
      'Content-Type': 'application/json',
      'Origin': 'http://127.0.0.1:5000',
    });
    return json.decode(response.body);
  }
}
