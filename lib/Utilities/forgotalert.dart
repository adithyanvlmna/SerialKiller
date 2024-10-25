// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void forgotPassword(context) {
  showDialog(
    context: context,
    builder: (value) {
      return const AlertD();
    },
  );
}

class AlertD extends StatefulWidget {
  const AlertD({super.key});

  @override
  State<AlertD> createState() => _AlertDState();
}

class _AlertDState extends State<AlertD> {
  var emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: AlertDialog(
          backgroundColor: Colors.black,
          title: const Center(
            child: Text(
              "Forgot Password",
              style: TextStyle(color: Colors.white),
            ),
          ),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.red,
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email is required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 100, 59, 56),
                      hintText: "Enter your email",
                      hintStyle: const TextStyle(color: Colors.white70),
                      errorStyle: TextStyle(color: Colors.red[700]),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide:
                            BorderSide(color: Colors.redAccent.shade700),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        try {
                          var response = await http.post(
                            Uri.parse(
                                "https://demo.thathwaa.com/SerialKiller/api/api/forgot_password.php"),
                            body: {"email": emailController.text.toString()},
                          );

                          var decodedResponse = jsonDecode(response.body);

                          if (decodedResponse != null &&
                              decodedResponse["message"] != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                padding: const EdgeInsets.only(
                                    left: 12.0, right: 12.0, bottom: 12.0),
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                content: Center(
                                  child: Text(
                                    "Successfull: ${decodedResponse["message"]}",
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                padding: const EdgeInsets.only(
                                    left: 12.0, right: 12.0, bottom: 12.0),
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                content: const Center(
                                  child: Text(
                                    "Failed: Something Went Wrong",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            );
                          }

                          Navigator.pop(context);
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Text("Error: $e"),
                            ),
                          );
                        }
                      }
                    },
                    color: Colors.redAccent.shade700,
                    textColor: Colors.white,
                    splashColor: Colors.white70,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    minWidth: 100,
                    height: 50,
                    child: const Text("Submit"),
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
