import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xlab/modals/offer.dart';

class NewOffer extends StatelessWidget {
  static const routeName = '/new-offer-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          onPressed: () {
            Provider.of<Offers>(context,listen: false).addNewOffer(
              Offer(
                title: 'test',
                imageUrl: 'https://wallpaperaccess.com/full/2153811.jpg',
                preview: 'This offer is so good',
                details:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
              ),
            );
          },
          child: Text('Add new offer'),
        ),
      ),
    );
  }
}
