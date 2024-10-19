import 'package:flutter/material.dart';
import 'package:serialkiller/Utilities/customcontainer.dart';

class Jobstatusview extends StatefulWidget {
  const Jobstatusview({super.key});

  @override
  State<Jobstatusview> createState() => _JobstatusviewState();
}

class _JobstatusviewState extends State<Jobstatusview> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            "Job Status",
            style: TextStyle(color: Colors.white),
          ),
          bottom: const PreferredSize(
              preferredSize: Size.fromHeight(40.0),
              child: Customcontainer(
                  color: Color.fromARGB(255, 183, 28, 28),
                  height: 49,
                  width: double.infinity,
                  child: TabBar(
                    tabs: [
                      Tab(text: "Pending"),
                      Tab(text: "Submitted"),
                      Tab(text: "Closed"),
                    ],
                    labelColor: Color.fromARGB(255, 183, 28, 28),
                    unselectedLabelColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(color: Colors.white),
                  ))),
        ),
        body: const TabBarView(children: [
          Center(child: Text("ccc")),
          Center(child: Text("bbb")),
          Center(child: Text("aaa")),
        ]),
      ),
    );
  }
}
