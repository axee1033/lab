import 'package:flutter/material.dart';

import '../screens/admin-screens/admin_signin_screen.dart';
import '../screens/points_screen.dart';
import '../widgets/badge.dart';
import '../widgets/offers_tab.dart';
import '../widgets/home_visit_tab.dart';
import '../widgets/branches.dart';
import '../widgets/about_us_tab.dart';

class HomeTab extends StatelessWidget {
  final int tabIndex;

  const HomeTab({Key key, this.tabIndex}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tabIndex == 0
              ? 'Our Offers'
              : tabIndex == 1
                  ? 'Home Visit'
                  : tabIndex == 2
                      ? 'Our Branches'
                      : 'About Us',
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(AdminSigninScreen.routeName);
            },
            child: Icon(Icons.admin_panel_settings),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(PointsScreen.routeName);
            },
            child: Badge(
              child: Icon(Icons.control_point_sharp),
              value: '0',
              color: Colors.deepPurple,
            ),
          ),
        ],
      ),
      body: tabIndex == 0
          ? OffersTab()
          : tabIndex == 1
              ? HomeVisitTab()
              : tabIndex == 2
                  ? BranchesTab()
                  : AboutUsTab(),
    );
  }
}
