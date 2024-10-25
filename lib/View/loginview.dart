// ignore_for_file: avoid_print, use_build_context_synchronously

import 'dart:convert'; // Add this import to handle JSON
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serialkiller/Utilities/customappbarclipper.dart';
import 'package:serialkiller/Utilities/forgotalert.dart';
import 'package:http/http.dart' as http;
import 'package:serialkiller/Utilities/routes.dart';
import 'package:serialkiller/ViewModel/loginuserprovider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginview extends StatefulWidget {
  const Loginview({super.key});

  @override
  State<Loginview> createState() => _LoginviewState();
}

class _LoginviewState extends State<Loginview> {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();

  bool obscurevalue = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(145.0),
          child: ClipPath(
            clipper: CustomAppBarClipper(),
            child: AppBar(
              flexibleSpace: Padding(
                  padding: const EdgeInsets.only(top: 17),
                  child: Container(
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://seeklogo.com/images/D/detective-logo-E3D520D0A0-seeklogo.com.png")),
                        color: Colors.red[900]),
                  )),
              centerTitle: true,
              backgroundColor: Colors.red[900],
            ),
          ),
        ),
        body: Container(
          height: double.infinity,
          color: Colors.redAccent.shade700,
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.black,
                    controller: emailcontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email is required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.red[700]),
                      errorStyle: const TextStyle(color: Colors.white),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: obscurevalue,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.black,
                    controller: passwordcontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password is required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscurevalue = !obscurevalue;
                          });
                        },
                        icon: const Icon(Icons.remove_red_eye),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.red[700]),
                      errorStyle: const TextStyle(color: Colors.white),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: TextButton.icon(
                        iconAlignment: IconAlignment.end,
                        onPressed: () async {
                          final pref = await SharedPreferences.getInstance();
                          if (formkey.currentState!.validate()) {
                            var response = await http.post(
                              Uri.parse(
                                  "https://demo.thathwaa.com/SerialKiller/api/api/login.php"),
                              headers: {
                                "token": "1adc2e7712f265fa85fe865a0d9b059b"
                              },
                              body: {
                                "username": emailcontroller.text.toString(),
                                "password": passwordcontroller.text.toString()
                              },
                            );
                            print(response.statusCode);
                            print(response.body);
                            if (response.statusCode == 200) {
                              var jsonResponse = jsonDecode(response.body);

                              if (jsonResponse["message"] ==
                                  "Logged in successfully") {
                                var tokenvalue =
                                    jsonResponse["data"]["password"];
                                print(tokenvalue);
                                pref.setString("token", tokenvalue);
                                var user = jsonResponse["data"]["username"];
                                pref.setString("email", user);
                                print(response.body);

                                Navigator.pushNamed(context, Routes.home,
                                    arguments: user);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    padding: const EdgeInsets.only(
                                        bottom: 15.0, right: 8.0, left: 8.0),
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    content: Center(
                                      child: Text(
                                        "Login failed: ${jsonResponse["message"]}",
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                );
                              }
                            }
                          }
                        },
                        style: ButtonStyle(
                          iconColor: WidgetStatePropertyAll(
                            Colors.redAccent.shade700,
                          ),
                        ),
                        icon: const Icon(Icons.arrow_forward),
                        label: Text(
                          "Next",
                          style: TextStyle(color: Colors.red[700]),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      forgotPassword(context);
                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
