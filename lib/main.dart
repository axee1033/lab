import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/admin-screens/add_new_branch_Screen.dart';
import './screens/admin-screens/add_new_offer_screen.dart';
import './screens/admin-screens/admin_signin_screen.dart';
import './screens/admin-screens/admin_screen.dart';
import './screens/points_screen.dart';
import './screens/profile_screen.dart';
import './screens/splash_screen.dart';
import './screens/offer_detials_screen.dart';
import './screens/home_screen.dart';
import 'modals/branches.dart';
import 'modals/offer.dart';
import 'modals/paitionAppot.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Offers()),
        ChangeNotifierProvider(create: (_) => PaitionAppounts()),
        ChangeNotifierProvider(create: (_) => Branches()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'X lab',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        canvasColor: Color.fromRGBO(255, 253, 228, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (ctx) => SplashScreen(),
        HomeScreen.routeName: (ctx) => HomeScreen(),
        OfferDetailsScreen.routeName: (ctx) => OfferDetailsScreen(),
        PointsScreen.routeName: (ctx) => PointsScreen(),
        ProfileScreen.routeName: (ctx) => ProfileScreen(),
        AdminScreen.routeName: (ctx) => AdminScreen(),
        NewBranch.routeName :(ctx) =>NewBranch(),
        NewOffer.routeName : (ctx) =>NewOffer(), 
        AdminSigninScreen.routeName:(ctx) =>AdminSigninScreen(),
      },
    );
  }
}
