import 'dart:ui';
import 'package:flutter/material.dart';

import '../modals/offer.dart';

class OfferDetailsScreen extends StatelessWidget {
  static const routeName = '/offer-details-screen';

  @override
  Widget build(BuildContext context) {
    final Offer offer = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              Image.network(
                offer.imageUrl,
                fit: BoxFit.cover,
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  offer.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: Text(offer.details),
              ),
            ]),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.sanitizer),
      ),
    );
  }
}
