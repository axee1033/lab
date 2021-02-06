import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class PaitionAppount {
  String name;
  String phoneNumber;
  String address;
  String testname;
  String corporationName;
  String dateFormat;

  PaitionAppount({
    @required this.name,
    @required this.phoneNumber,
    @required this.address,
    @required this.testname,
    @required this.corporationName,
    @required this.dateFormat,
  });
}

class PaitionAppounts with ChangeNotifier {
  Future<void> sendPaitionAppount(PaitionAppount p) async {
    const url = 'https://xlab-f8b06-default-rtdb.firebaseio.com/appounts.json';
    try {
       await http.post(
        url,
        body: json.encode({
          'name': p.name,
          'phoneNumber': p.phoneNumber,
          'address': p.address,
          'testname': p.testname,
          'corporationName': p.corporationName,
          'dateFormat': p.dateFormat,
        }),
      );
      print('sent');
      notifyListeners();
    } catch (e) {
      throw (e);
    }
  }
}
