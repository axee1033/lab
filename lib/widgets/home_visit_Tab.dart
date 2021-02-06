import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modals/paitionAppot.dart';

class HomeVisitTab extends StatefulWidget {
  @override
  _HomeVisitTabState createState() => _HomeVisitTabState();
}

class _HomeVisitTabState extends State<HomeVisitTab> {
  DateTime currentDate = DateTime.now();
  PaitionAppount paitionAppount = PaitionAppount(
    address: '',
    name: '',
    phoneNumber: '',
    corporationName: '',
    dateFormat: '',
    testname: '',
  );

  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        print(pickedDate.toString());
        currentDate = pickedDate;
        paitionAppount.dateFormat = pickedDate.toString();
      });
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person), labelText: 'patient name'),
              onSaved: (val) {
                paitionAppount.name = val;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone), labelText: 'patient number'),
              onSaved: (val) {
                paitionAppount.phoneNumber = val;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.location_on), labelText: 'address'),
              onSaved: (val) {
                paitionAppount.address = val;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.local_bar), labelText: 'test name'),
              onSaved: (val) {
                paitionAppount.testname = val;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.location_city_sharp),
                  labelText: 'Corporation'),
              onSaved: (val) {
                paitionAppount.corporationName = val;
              },
            ),
            Container(
              width: double.infinity,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      'Selected date is :${DateFormat('dd/MM/yyyy ').format(currentDate)}'),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.deepPurple.withOpacity(0.2),
                    child: FlatButton(
                      child: Icon(Icons.event),
                      onPressed: () {
                        _selectDate(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
            FlatButton(
              color: Colors.blue.withOpacity(0.2),
              child: Text('Send'),
              onPressed: () {
                _formKey.currentState.save();
                Provider.of<PaitionAppounts>(context, listen: false)
                    .sendPaitionAppount(paitionAppount);
              },
            ),
          ],
        ),
      ),
    );
  }
}
