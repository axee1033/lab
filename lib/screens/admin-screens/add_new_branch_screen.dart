import 'package:flutter/material.dart';

class NewBranch extends StatelessWidget {
  static const routeName= '/new-branch-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Add new branch'),
      ),
    );
  }
}
