import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serialkiller/Utilities/customcontainer.dart';
import 'package:serialkiller/Utilities/routes.dart';
import 'package:serialkiller/ViewModel/loginuserprovider.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  final formkey = GlobalKey<FormState>();
  String? dropdownvalue1;
  String? dropdownvalue2;

  @override
  Widget build(BuildContext context) {
    // var user = ModalRoute.of(context)!.settings.arguments as dynamic;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "SERIAL KILLER",
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        elevation: 25,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(""),
              accountEmail: const Text(""),
              currentAccountPicture: CircleAvatar(
                radius: 45,
                backgroundColor: Colors.white,
                child: InkWell(
                  onTap: () {},
                  child: const CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.red,
                      backgroundImage: NetworkImage(
                          "https://seeklogo.com/images/D/detective-logo-E3D520D0A0-seeklogo.com.png")),
                ),
              ),
              decoration: BoxDecoration(color: Colors.red[900]),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: const Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: const Text(
                "Home",
                style: TextStyle(color: Colors.white),
              ),
              tileColor: Colors.black,
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, Routes.jobstatus);
              },
              leading: const Icon(
                Icons.work,
                color: Colors.white,
              ),
              title: const Text(
                "Job Status",
                style: TextStyle(color: Colors.white),
              ),
              tileColor: Colors.black,
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, Routes.myprofile,);
              },
              leading: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              title: const Text(
                "My Profile",
                style: TextStyle(color: Colors.white),
              ),
              tileColor: Colors.black,
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, Routes.changepasswd);
              },
              leading: const Icon(
                Icons.lock,
                color: Colors.white,
              ),
              title: const Text(
                "Change Password",
                style: TextStyle(color: Colors.white),
              ),
              tileColor: Colors.black,
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              title: const Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              ),
              tileColor: Colors.black,
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.redAccent.shade700,
        height: double.infinity,
        child: Form(
            key: formkey,
            child: ListView(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 200, left: 8.0, right: 8.0),
                  child: DropdownButtonFormField(
                    value: dropdownvalue1,
                    validator: (value) {
                      if (value == null) {
                        return "Job number is requird";
                      }
                      return null;
                    },
                    icon: const Icon(Icons.arrow_drop_down),
                    items: [
                      DropdownMenuItem(
                          value: "147",
                          child: Text(
                            "147",
                            style: TextStyle(color: Colors.redAccent.shade700),
                          )),
                      DropdownMenuItem(
                          value: "148",
                          child: Text(
                            "148",
                            style: TextStyle(color: Colors.redAccent.shade700),
                          )),
                    ],
                    dropdownColor: Colors.black,
                    iconEnabledColor: Colors.redAccent.shade700,
                    decoration: InputDecoration(
                        errorStyle: const TextStyle(color: Colors.white),
                        labelText: "Job Number",
                        labelStyle: TextStyle(color: Colors.red.shade700),
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(5))),
                    onChanged: (value) {
                      setState(() {
                        dropdownvalue1 = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 30, left: 8.0, right: 8.0),
                  child: DropdownButtonFormField(
                    value: dropdownvalue2,
                    validator: (value) {
                      if (value == null) {
                        return "Job Type is requird";
                      }
                      return null;
                    },
                    icon: const Icon(Icons.arrow_drop_down),
                    items: [
                      DropdownMenuItem(
                          value: "Selfemployed",
                          child: Text(
                            "Selfemployed",
                            style: TextStyle(color: Colors.red[700]),
                          )),
                      DropdownMenuItem(
                          value: "Salaried",
                          child: Text(
                            "Salaried",
                            style: TextStyle(color: Colors.red[700]),
                          )),
                    ],
                    dropdownColor: Colors.black,
                    iconEnabledColor: Colors.redAccent.shade700,
                    decoration: InputDecoration(
                        errorStyle: const TextStyle(color: Colors.white),
                        labelText: "Job Type",
                        labelStyle: TextStyle(color: Colors.red.shade700),
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(5))),
                    onChanged: (value) {
                      setState(() {
                        dropdownvalue2 = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 250, bottom: 30, left: 200, right: 30),
                  child: Customcontainer(
                      color: Colors.white,
                      height: 50,
                      width: 200,
                      child: TextButton.icon(
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              Navigator.pushNamed(context, Routes.workview);
                            }
                          },
                          icon: const Icon(Icons.arrow_forward),
                          iconAlignment: IconAlignment.end,
                          style: ButtonStyle(
                              iconColor: WidgetStatePropertyAll(
                                  Colors.redAccent.shade700)),
                          label: const Text(
                            "Next",
                            style: TextStyle(color: Colors.red),
                          ))),
                )
              ],
            )),
      ),
    );
  }
}
