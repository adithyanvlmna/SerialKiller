import 'package:flutter/material.dart';

class Passwdupdateview extends StatefulWidget {
  const Passwdupdateview({super.key});

  @override
  State<Passwdupdateview> createState() => _PasswdupdateviewState();
}

class _PasswdupdateviewState extends State<Passwdupdateview> {
  var oldpswdcontroller = TextEditingController();
  var newpswdcontroller = TextEditingController();
  var confirmpswdcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Update password",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red[900],
      ),
      body: Container(
        color: Colors.black,
        height: double.infinity,
        width: double.infinity,
        child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: oldpswdcontroller,
                    cursorColor: Colors.white70,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your old password";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 93, 52, 49),
                        labelText: "Old Passwors",
                        labelStyle: const TextStyle(color: Colors.white70),
                        errorStyle: TextStyle(color: Colors.redAccent.shade700),
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Colors.black),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: newpswdcontroller,
                    cursorColor: Colors.white70,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your New password";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 93, 52, 49),
                        labelText: "New Passwors",
                        labelStyle: const TextStyle(color: Colors.white70),
                        errorStyle: TextStyle(color: Colors.redAccent.shade700),
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Colors.black),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: confirmpswdcontroller,
                    cursorColor: Colors.white70,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Confirm password is required";
                      }
                      if (newpswdcontroller.text !=
                          confirmpswdcontroller.text) {
                        return "Invalid password";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 93, 52, 49),
                        labelText: "Confirm Password",
                        labelStyle: const TextStyle(color: Colors.white70),
                        errorStyle: TextStyle(color: Colors.redAccent.shade700),
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Colors.black),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                      
                      }
                    },
                    color: Colors.redAccent.shade700,
                    textColor: Colors.white,
                    splashColor: Colors.white70,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    minWidth: 200,
                    height: 50,
                    child: const Text("Update"),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
