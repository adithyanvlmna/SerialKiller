import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/logineduser.dart';

class Loginuserprovider extends ChangeNotifier {
  List<Logineduser> logineduser = [];
  List<Logineduser> get userGetter => logineduser;

  Future<void> getuser() async {
    final pref = await SharedPreferences.getInstance();
    String? email = pref.getString("email");
    var response = await http.post(
      Uri.parse(
          "https://demo.thathwaa.com/SerialKiller/api/api/myprofile.php?token=1adc2e7712f265fa85fe865a0d9b059b"),
      headers: {"token": "1adc2e7712f265fa85fe865a0d9b059b"},
      body: {"email": email.toString()},
    );
    print(response.body);
    var jsonresponse = jsonDecode(response.body);

    // Corrected the if condition
    if (jsonresponse["status"] == "true" && jsonresponse["data"] != null) {
      List<dynamic> decodedresponse = jsonresponse["data"];
      List<Logineduser> finalresponse = decodedresponse
          .map((mapdata) => Logineduser.fromMap(mapdata))
          .toList();
      logineduser = finalresponse;
    } else {
      print("Error: $jsonresponse");
    }
    notifyListeners();
  }

  Future<void> chanePassword(context, String email, String oldpassword,
      String newpassword, String confirmpasswd) async {
    // final pref = await SharedPreferences.getInstance();
    // String? token = pref.getString("token");
    var response = await http.post(
        Uri.parse(
            "https://demo.thathwaa.com/SerialKiller/api/api/change_password.php"),
        headers: {
          "token": "1adc2e7712f265fa85fe865a0d9b059b"
        },
        body: {
          "Email": email.toString(),
          "old": oldpassword,
          "password": newpassword.toString(),
          "confirm": confirmpasswd.toString()
        });
    print(response.statusCode);

    print(response.body);
    var jsonresponse = jsonDecode(response.body);
    if (jsonresponse["message"] == "Passsword has been changed succesfully") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          padding: const EdgeInsets.all(15.0),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          content: Center(
            child: Text(
              "${jsonresponse["message"]}",
              style: const TextStyle(color: Colors.black),
            ),
          )));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          padding: const EdgeInsets.all(15.0),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          content: Center(
            child: Text(
              "Failed:${jsonresponse["message"]}",
              style: const TextStyle(color: Colors.black),
            ),
          )));
    }
    notifyListeners();
  }
}
