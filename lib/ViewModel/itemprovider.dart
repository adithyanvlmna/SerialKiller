// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:serialkiller/Model/items.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Itemprovider extends ChangeNotifier {
  List<Items> items = [];
  List<Items> get itemsGetter => items;

  Future<void> getItems() async {
    final pref = await SharedPreferences.getInstance();
    String? token = pref.getString("token");

    if (token == null) {
      print("No token found!");
      return;
    }

    final response = await http.get(
        Uri.parse(
            "https://demo.thathwaa.com/SerialKiller/api/api/item_category.php?"),
        headers: {"token": "1adc2e7712f265fa85fe865a0d9b059b"});
    print(response.body);

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedResponse = jsonDecode(response.body);

      if (decodedResponse.containsKey("data") &&
          decodedResponse["data"] is List) {
        List<dynamic> data = decodedResponse["data"];

        List<Items> finalResponse = data
            .map((mapData) => Items.fromMap(mapData as Map<String, dynamic>))
            .toList();

        items = finalResponse;
        notifyListeners();
      } else {
        print('Data is either missing or not a list');
      }
    } else {
      print('Failed to load items: ${response.statusCode}');
    }
  }
}
