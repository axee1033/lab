import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Branch {
  final String townName;
  final String streetName;
  final List latLang;

  Branch({
    @required this.townName,
    @required this.streetName,
    @required this.latLang,
  });
}

class Branches with ChangeNotifier {
  List<Branch> _items = [];
  List<Branch> get items {
    return [..._items];
  }

  Future<void> fetchBranchesAndSet() async {
    const url = 'https://xlab-f8b06-default-rtdb.firebaseio.com/branches.json';
    try {
      var response = await http.get(url);

      final extractedData = json.decode(response.body) as Map<String,dynamic>;
      print(extractedData);
      if (extractedData == null) {
        return;
      }
      final List<Branch> loadedBranches = [];
      extractedData.forEach((prodid,prodData) {
        loadedBranches.add(
          Branch(
            townName: prodData['townName'],
            streetName: prodData['streetName'],
            latLang: prodData['latLang'],
          ),
        );
      });
      print(loadedBranches.length);
      _items = loadedBranches;

      notifyListeners();
    } catch (e) {
      throw (e);
    }
  }

  Future<void> addNewBranch(Branch branch) async {
    const url = 'https://xlab-f8b06-default-rtdb.firebaseio.com/branches.json';
    try {
      await http.post(
        url,
        body: json.encode({
          'townName': branch.townName,
          'streetName': branch.streetName,
          'latLang': branch.latLang,
        }),
      );
    } catch (e) {
      throw (e);
    }
  }
}
