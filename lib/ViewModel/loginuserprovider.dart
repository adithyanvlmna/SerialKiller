import 'package:flutter/material.dart';
import 'package:serialkiller/Model/logineduser.dart';

class Loginuserprovider extends ChangeNotifier {
  List<Logineduser> user = [];
  List<Logineduser> get userGetter => user;
  void getUser(dynamic decodedresponse) {
    List<dynamic> decodersponse = decodedresponse;
    List<Logineduser> finalresponse =
        decodersponse.map((mapdata) => Logineduser.fromMap(mapdata)).toList();
    user = finalresponse;
    notifyListeners();
  }
}
