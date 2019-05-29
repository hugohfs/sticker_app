import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sticker_app/models/OpenFoodFacts/OffObject.dart';
//import 'package:sticker_app/services/authentication.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart' as font_awesome_flutter;
import 'package:barcode_scan/barcode_scan.dart';
import 'package:sticker_app/globals/globals.dart' as g;
import 'package:sticker_app/pages/producto.dart';

class PerfilPage extends StatefulWidget {
  /*PerfilPage({Key key, this.auth, this.userId, this.onSignedOut})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;*/

  @override
  State<StatefulWidget> createState() => new _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  String _stickerBuscar;
  final _formKey = new GlobalKey<FormState>();
  String _errorMessage;

  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        /*appBar: new AppBar(title: new Text('Open Food Facts')),*/
        /*floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              _scanQR();
            },
            icon: Icon(Icons.camera_alt),
            label: Text("Scan")
        ),*/
        body: new Container(
            padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
            child: new Form(
              key: _formKey,
              child: new ListView(
                shrinkWrap: true,
                children: <Widget>[
                  _showUserImage(),
                  _showUserInfo(),
                  _showErrorMessage(),
                  _showUserStickersHeader(),
                  _showUserStickers(),
                ],
              ),
            )));
  }

  Widget _showUserStickersHeader() {
    return Container(
        padding: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Text(g.STICKERS_STICKERS_USUARIO),
          Divider(
            height: 15.0,
            color: Colors.grey,
          ),
        ]));
  }

  Widget _showUserStickers() {
    return Center(
        child: Container(
            child: Wrap(children: <Widget>[
      IconButton(
          iconSize: 85.0,
          icon: Icon(Icons.bookmark,
              //size: 100.0,
              color: Colors.purple)),
      IconButton(
          iconSize: 85.0,
          icon: Icon(Icons.bookmark,
              //size: 100.0,
              color: Colors.blue)),
      IconButton(
          iconSize: 85.0,
          icon: Icon(Icons.bookmark,
              //size: 100.0,
              color: Colors.green)),
      IconButton(
          iconSize: 85.0,
          icon: Icon(Icons.bookmark,
              //size: 100.0,
              color: Colors.yellow)),
    ])));
  }

  Widget _showUserImage() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
        child: Container(width: 100, height: 100, child: Image.asset('assets/flutter-icon.png')));
  }

  Widget _showUserInfo() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
        child: Wrap(
          children: <Widget>[
            /*Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child: Container(
                    child: Text(
                  'Usuario',
                  style: TextStyle(fontSize: 20),
                ))),//]),*/
            //Padding(padding: const EdgeInsets.fromLTRB(100.0, 0.0, 0.0, 0.0)),
            Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child: Center(
                    child: Container(
                        width: 200.0,
                        child: TextFormField(
                          controller: _textEditingController,
                          maxLines: 1,
                          keyboardType: TextInputType.emailAddress,
                          autofocus: false,
                          decoration: new InputDecoration(
                              hintText: 'Nombre del usuario',
                              icon: new Icon(
                                Icons.account_circle,
                                color: Theme.of(context).accentColor,
                              )),
                          validator: (value) =>
                              value.isEmpty ? 'El texto no pueder estar vacío' : null,
                          onSaved: null, //(value) => _barcode = value,
                        )))),
          ],
        ));
  }

  Future<String> _validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
    });
    if (_validateAndSave()) {
      try {
        //_getDataFromAPI();

        return 'OK';
      } catch (e) {
        print('Error: $e');
        setState(() {
          _errorMessage = e.message;
        });
      }
    }
  }

// Check if form is valid before perform login or signup
  bool _validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Widget _showErrorMessage() {
    if (_errorMessage != null && _errorMessage.length > 0) {
      return new Text(
        _errorMessage,
        style:
            TextStyle(fontSize: 13.0, color: Colors.red, height: 1.0, fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }
}
