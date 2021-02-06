import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Offer {
  final String title;
  final String imageUrl;
  final String preview;
  final String details;

  Offer(
      {@required this.title,
      @required this.imageUrl,
      @required this.preview,
      @required this.details});
}

class Offers with ChangeNotifier {
  List<Offer> _items = [];
  final String url =
      "https://xlab-f8b06-default-rtdb.firebaseio.com/offers.json";
  List<Offer> get items {
    return [..._items];
  }

  Future<void> addNewOffer(Offer offer) async {
    try {
      var response = await http.post(
        url,
        body: json.encode({
          'title': offer.title,
          'details': offer.details,
          'preview': offer.preview,
          'imageUrl': offer.imageUrl,
        }),
      );
      print(response.body);
      _items.add(offer);

      notifyListeners();
    } catch (e) {
      throw (e);
    }
  }

  Future<void> getOffersAndSet() async {
    try {
      var response = await http.get(url);

      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      print(extractedData);
      if (extractedData == null) {
        return;
      }
      final List<Offer> loadedOffers = [];
      extractedData.forEach((prodid, prodData) {
        loadedOffers.add(
          Offer(
            title: prodData['title'],
            details: prodData['details'],
            preview: prodData['preview'],
            imageUrl: prodData['imageUrl'],
          ),
        );
      });

      _items = loadedOffers;

      notifyListeners();
    } catch (e) {
      throw (e);
    }
  }
}
