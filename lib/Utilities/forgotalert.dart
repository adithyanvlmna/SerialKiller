import 'package:flutter/material.dart';

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
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.pop(context);
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

