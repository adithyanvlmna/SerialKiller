import 'package:flutter/material.dart';

void updateAlert(context) {
  showDialog(
      context: context,
      builder: (value) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: SizedBox(
            height: MediaQuery.of(context).size.width * 0.9,
            child: AlertDialog(
              title: const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: Text(
                  "Data insert successfully",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
              content: const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: Text(
                  "Need to add more items?",
                  style: TextStyle(color: Colors.white70),
                ),
              ),
              actions: [
                MaterialButton(
                  onPressed: () {},
                  color: Colors.red,
                  textColor: Colors.white,
                  splashColor: Colors.white70,
                  minWidth: 80,
                  height: 32,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: const Text("Yes"),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  height: 32,
                  width: 90,
                  child: Center(
                    child: TextButton.icon(
                      onPressed: () {},
                      label: const Text(
                        "Next",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: const ButtonStyle(
                          iconColor: WidgetStatePropertyAll(Colors.black),
                          iconSize: WidgetStatePropertyAll(20)),
                      icon: const Icon(Icons.arrow_forward),
                      iconAlignment: IconAlignment.end,
                    ),
                  ),
                )
              ],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: Colors.black,
            ),
          ),
        );
      });
}
