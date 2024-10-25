import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:serialkiller/Utilities/customappbarclipperinside.dart';
import 'package:serialkiller/ViewModel/loginuserprovider.dart';

class Profileview extends StatefulWidget {
  const Profileview({super.key});

  @override
  State<Profileview> createState() => _ProfileviewState();
}

class _ProfileviewState extends State<Profileview> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Loginuserprovider>(context, listen: false);
    provider.getuser();
    return SafeArea(
        child: Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(303.0),
        child: ClipPath(
          clipper: CustomAppBarClipper2(),
          child: AppBar(
            backgroundColor: Colors.red[900],
            title: const Text(
              "My Profile",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            centerTitle: true,
            iconTheme: const IconThemeData(color: Colors.white),
            flexibleSpace: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Consumer<Loginuserprovider>(builder: (context, data, _) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: const CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.white,
                        ),
                      ),
                       Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          data.userGetter[0].email,
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  );
                })),
          ),
        ),
      ),
      body: Container(),
    ));
  }
}
