import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import './add_new_branch_Screen.dart';
import './add_new_offer_Screen.dart';

class AdminScreen extends StatefulWidget {
  static const routeName = '/admin-screen';

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  Position userPosition;

  Future<void> loacteBrachBosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.longitude.toString());
    userPosition = position;
  }

  @override
  Widget build(BuildContext context) {
    final List<List> buttons = [
      [
        'Add new offer',
        Colors.blue,
        () {
          Navigator.of(context).pushNamed(NewOffer.routeName);
        },
      ],
      [
        'Add new branch',
        Colors.red,
        () {
          Navigator.of(context).pushNamed(NewBranch.routeName);
        },
      ],
      [
        'Add new branch',
        Colors.yellow,
        () {
          print('Branches');
        },
      ],
      [
        'Add new branch',
        Colors.orangeAccent,
        () {
          print('Branches');
        },
      ],
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: Center(
                child: Text(
                  'Admin Pannel',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto'),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 500,
              child: GridView.builder(
                padding: EdgeInsets.all(25),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 1,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20.0,
                ),
                itemBuilder: (context, index) => AdminOptions(
                  title: buttons[index][0],
                  color: buttons[index][1],
                  onTap: buttons[index][2],
                ),
                itemCount: buttons.length,
              ),
            ),
            Container(
              width: double.infinity,
              //height: 100,
              color: Colors.black,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Center(
                      child: Text(
                        'Copy rights X 2021',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.copyright,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AdminOptions extends StatelessWidget {
  final String title;
  final Color color;
  final Function onTap;
  AdminOptions({
    @required this.title,
    @required this.color,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
      ),
    );
  }
}
