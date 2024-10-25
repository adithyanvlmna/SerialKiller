import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serialkiller/Utilities/routes.dart';
import 'package:serialkiller/ViewModel/itemprovider.dart';

class Workview extends StatefulWidget {
  const Workview({super.key});

  @override
  State<Workview> createState() => _WorkviewState();
}

class _WorkviewState extends State<Workview> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Itemprovider>(context, listen: false);
    provider.getItems();
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color.fromARGB(255, 174, 9, 9),
          title: const Text(
            "SERIAL KILLER",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Consumer<Itemprovider>(builder: (context, data, _) {
          return Container(
              color: Colors.redAccent.shade700,
              child: data.itemsGetter.isNotEmpty
                  ? GridView.builder(
                      itemCount: data.itemsGetter.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.9,
                              crossAxisSpacing: 0.5,
                              mainAxisSpacing: 0.8),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.detailinput);
                          },
                          child: Card(
                            color: Colors.white70,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    height: 80,
                                    child: Center(
                                        child: Image.network(
                                      data.itemsGetter[index].categoryimg,
                                    ))),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                      data.itemsGetter[index].itemcategory),
                                )
                              ],
                            ),
                          ),
                        );
                      })
                  : const Center(
                      child: CircularProgressIndicator(
                      color: Colors.white,
                    )));
        }));
  }
}
