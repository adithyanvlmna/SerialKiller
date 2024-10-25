import 'package:flutter/material.dart';
import 'package:serialkiller/Utilities/customcontainer.dart';

import 'package:serialkiller/Utilities/updatealert.dart';

class Detailinputview extends StatefulWidget {
  const Detailinputview({super.key});

  @override
  State<Detailinputview> createState() => _DetailinputviewState();
}

class _DetailinputviewState extends State<Detailinputview> {
  String? dropdownvalue1;
  String? dropdownvalue2;
  String? dropdownvalue3;
  var modelcontroller = TextEditingController();
  var serialcontroller = TextEditingController();
  var confmserialcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "SERIAL KILLER",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 174, 9, 9),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: const Color.fromRGBO(233, 23, 8, 1),
        child: Form(
            key: formkey,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField(
                      validator: (value) {
                        if (value == null) {
                          return "Select field";
                        }
                        return null;
                      },
                      value: dropdownvalue1,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconEnabledColor: Colors.red,
                      dropdownColor: Colors.white70,
                      decoration: const InputDecoration(
                          errorStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Area",
                          labelStyle: TextStyle(color: Colors.red),
                          hintText: "Select Area",
                          hintStyle: TextStyle(color: Colors.black),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white))),
                      items: const [
                        DropdownMenuItem(
                            value: "Lounge",
                            child: Text(
                              "Lounge",
                              style: TextStyle(color: Colors.black),
                            )),
                        DropdownMenuItem(
                            value: "Kitchen",
                            child: Text(
                              "Kitchen",
                              style: TextStyle(color: Colors.black),
                            ))
                      ],
                      onChanged: (value) {
                        setState(() {
                          dropdownvalue1 = value!;
                        });
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField(
                      value: dropdownvalue2,
                      validator: (value) {
                        if (value == null) {
                          return "Select field";
                        }
                        return null;
                      },
                      icon: const Icon(Icons.arrow_drop_down),
                      iconEnabledColor: Colors.red,
                      dropdownColor: Colors.white70,
                      decoration: const InputDecoration(
                          errorStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Item",
                          labelStyle: TextStyle(color: Colors.red),
                          hintText: "Select item",
                          hintStyle: TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white))),
                      items: const [
                        DropdownMenuItem(
                          value: "Tv",
                          child: Text(
                            "Tv",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        DropdownMenuItem(
                            value: "Clock",
                            child: Text(
                              "Clock",
                              style: TextStyle(color: Colors.black),
                            ))
                      ],
                      onChanged: (value) {
                        setState(() {
                          dropdownvalue2 = value;
                        });
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField(
                      icon: const Icon(Icons.arrow_drop_down),
                      iconEnabledColor: Colors.red,
                      dropdownColor: Colors.white70,
                      value: dropdownvalue3,
                      decoration: const InputDecoration(
                          errorStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Brand",
                          labelStyle: TextStyle(color: Colors.red),
                          hintText: "Select Brand",
                          hintStyle: TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white))),
                      validator: (value) {
                        if (value == null) {
                          return "select a field";
                        }
                        return null;
                      },
                      items: const [
                        DropdownMenuItem(
                            value: "Acer",
                            child: Text(
                              "Acer",
                              style: TextStyle(color: Colors.black),
                            )),
                        DropdownMenuItem(
                            value: "Apple",
                            child: Text(
                              "Apple",
                              style: TextStyle(color: Colors.black),
                            ))
                      ],
                      onChanged: (value) {
                        dropdownvalue3 = value;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: modelcontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter the model name";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Model",
                        labelStyle: TextStyle(color: Colors.red),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: serialcontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter the Serial name";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Serial",
                        labelStyle: TextStyle(color: Colors.red),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: confmserialcontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "confirm your serial";
                      }
                      if (confmserialcontroller.text != serialcontroller.text) {
                        return "incorrect serial";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Confirm Serial",
                        labelStyle: TextStyle(color: Colors.red),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 8.0, left: 8.0, top: 15.0),
                  child: Customcontainer(
                    color: Colors.white,
                    height: 50.0,
                    width: 200.0,
                    child: Center(
                      child: TextButton.icon(
                        onPressed: () {},
                        label: const Text(
                          "Scan Code",
                          style: TextStyle(color: Colors.red),
                        ),
                        icon: const Icon(Icons.qr_code),
                        iconAlignment: IconAlignment.start,
                        style: const ButtonStyle(
                            iconColor: WidgetStatePropertyAll(Colors.red)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 8.0, left: 8.0, top: 20.0),
                  child: MaterialButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        updateAlert(context);
                      }
                    },
                    color: Colors.white,
                    textColor: Colors.red,
                    splashColor: Colors.white70,
                    minWidth: 200,
                    height: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3)),
                    child: const Text("Update"),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
