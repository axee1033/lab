import 'dart:io';
import 'dart:ui';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:provider/provider.dart';
import 'package:xlab/modals/offer.dart';
import 'package:xlab/screens/admin-screens/image_upload_tester.dart';

class NewOffer extends StatefulWidget {
  static const routeName = '/new-offer-screen';

  @override
  _NewOfferState createState() => _NewOfferState();
}

class _NewOfferState extends State<NewOffer> {
  File _image;
  String _uploadedFileURL;
  var _isUpload = false;
  final _formKey = GlobalKey<FormState>();
  Offer offer = Offer(
    title: '',
    imageUrl: '',
    details: '',
    preview: '',
  );

  Future chooseFile() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = image;
      });
    });
  }

  Future uploadFile() async {
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('offersimages/${Path.basename(_image.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL = fileURL;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 6,
          left: MediaQuery.of(context).size.width / 10,
          right: MediaQuery.of(context).size.width / 10,
        ),
        child: ListView(
          children: [
            Text(
              'Add New Offer',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 20),
            TextFormField(
              onSaved: (val) {
                offer.title = val;
              },
              decoration: InputDecoration(
                labelText: 'Offer title',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              onSaved: (val) {
                offer.preview = val;
              },
              decoration: InputDecoration(
                labelText: 'Offer overview',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              onSaved: (val) {
                offer.details = val;
              },
              decoration: InputDecoration(
                labelText: 'offer details',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            _isUpload
                ? Center(
                    child: Text('Uploading Image please wait ....'),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                            image: AssetImage(_image != null
                                ? _image.path
                                : 'assets/images/logo.jfif'),
                          ),
                        ),
                        /* child: _image != null
                      ? Image.asset(_image.path)
                      : Image.asset('assets/images/logo.jfif'),*/
                      ),
                      RaisedButton(
                        child: Text('Choose Image'),
                        onPressed: () async {
                          await chooseFile();
                          setState(() {
                            _isUpload = true;
                          });
                          await uploadFile();
                          setState(() {
                            _isUpload = false;
                          });
                          offer.imageUrl = _uploadedFileURL;
                        },
                        color: Colors.cyan,
                      ),
                    ],
                  ),
            FlatButton(
              color: Colors.grey,
              child: Text('Publish Offer'),
              onPressed: () {
                _formKey.currentState.save();
                Provider.of<Offers>(context, listen: false).addNewOffer(offer);
              },
            ),
          ],
        ),
      ),
    ));
  }
}
/*
Center(
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
      ),*/
