import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xlab/modals/offer.dart';

import '../widgets/offer_card.dart';

class OffersTab extends StatefulWidget {
  @override
  _OffersTabState createState() => _OffersTabState();
}

class _OffersTabState extends State<OffersTab> {
  List<Offer> offers;
  var isInit = true;
  var isLoading = false;

  @override
  void didChangeDependencies() async {
    if (isInit) {
      setState(() {
        isLoading = true;
      });
      await Provider.of<Offers>(context, listen: false).getOffersAndSet();
      setState(() {
        print(Provider.of<Offers>(context, listen: false).items.length);
        isLoading = false;
      });
      isInit = false;
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return OfferCard(
                offer: Provider.of<Offers>(context, listen: false).items[index],
              );
            },
            itemCount: Provider.of<Offers>(context, listen: false).items.length,
          );
  }
}
