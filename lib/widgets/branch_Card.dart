import 'package:flutter/material.dart';
import 'package:xlab/modals/branches.dart';

import 'package:url_launcher/url_launcher.dart';

class BranchCard extends StatelessWidget {
  final Branch branch;

  const BranchCard({@required this.branch});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            branch.townName,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 20,
            ),
          ),
          Text(
            branch.streetName,
            textAlign: TextAlign.center,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.deepPurple.withOpacity(0.3),
              borderRadius: BorderRadius.circular(30),
            ),
            child: FlatButton(
              child: Text('Map'),
              onPressed: () {
                MapUtils.openMap(branch.latLang[0], branch.latLang[1]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MapUtils {
  MapUtils._();

  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}
