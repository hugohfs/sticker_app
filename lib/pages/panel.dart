import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sticker_app/models/OpenFoodFacts/OffObject.dart';
//import 'package:sticker_app/services/authentication.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart'
    as font_awesome_flutter;
import 'package:barcode_scan/barcode_scan.dart';
import 'package:sticker_app/globals/globals.dart' as g;
import 'package:sticker_app/pages/producto.dart';

class PanelPage extends StatefulWidget {
  /*PanelPage({Key key, this.auth, this.userId, this.onSignedOut})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;*/

  @override
  State<StatefulWidget> createState() => new _PanelPageState();
}

class _PanelPageState extends State<PanelPage> {
  String _textMessage;
  Future<OffObject> _offObject;
  OffObject _offObjectCaptured;

  String _barcode;
  final _baseUrl = 'https://world.openfoodfacts.org/api/v0/product/';
  final _baseUrlEnd = '.json';
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
                  _showSearchInputAndButtons(),
                  _showErrorMessage(),
                  _showHistoryHeader(),
                  _showHistoryProducts(),
                  _showSuggestedHeader(),
                  _showSuggestedProducts(),
                  _showStickersHeader(),
                  _showUserStickers(),
                ],
              ),
            )));
  }

  Widget _showHistoryHeader() {
    return Container(
        padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(g.PANEL_HISTORIAL),
              Divider(
                height: 5.0,
                color: Colors.grey,
              ),
            ]));
  }

  Widget _showHistoryProducts() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: Center(
          child: Container(
        //margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
        height: 65.0,
        child: /*Wrap(*/
          ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(0.0, 0.0, 30.0, 0.0),
              width: 65.0,
              //color: Colors.orange,
              child: IconButton(
                  iconSize: 65.0,
                  icon: Icon(
                      Icons.image,
                      color: Colors.purple)
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0.0, 0.0, 30.0, 0.0),
              width: 65.0,
              //color: Colors.blue,
              child: IconButton(
                iconSize: 65.0,
                icon: Icon(
                    Icons.image,
                    color: Colors.blue)
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0.0, 0.0, 30.0, 0.0),
              width: 65.0,
              //color: Colors.green,
              child: IconButton(
                  iconSize: 65.0,
                  icon: Icon(
                      Icons.image,
                      color: Colors.green)
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0.0, 0.0, 30.0, 0.0),
              width: 65.0,
              //color: Colors.yellow,
              child: IconButton(
                  iconSize: 65.0,
                  icon: Icon(
                      Icons.image,
                      color: Colors.yellow)
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget _showSuggestedHeader() {
    return Container(
        padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(g.PANEL_SUGERENCIAS),
              Divider(
                height: 15.0,
                color: Colors.grey,
              )
            ]));
  }

  Widget _showSuggestedProducts() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: Center(
          child: Container(
        //margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
        //margin: EdgeInsets.symmetric(vertical: 10.0),
            height: 65.0,
            child: /*Wrap*/
              ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
            Container(
            margin: const EdgeInsets.fromLTRB(0.0, 0.0, 30.0, 0.0),
            width: 65.0,
            //color: Colors.purple,
            child: IconButton(
                iconSize: 65.0,
                icon: Icon(
                    Icons.image,
                    color: Colors.purple)
            ),
          ),
        Container(
          margin: const EdgeInsets.fromLTRB(0.0, 0.0, 30.0, 0.0),
          width: 65.0,
          //color: Colors.blue,
          child: IconButton(
              iconSize: 65.0,
              icon: Icon(
                  Icons.image,
                  color: Colors.blue)
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0.0, 0.0, 30.0, 0.0),
          width: 65.0,
          //color: Colors.green,
          child: IconButton(
              iconSize: 65.0,
              icon: Icon(
                  Icons.image,
                  color: Colors.green)
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0.0, 0.0, 30.0, 0.0),
          width: 65.0,
          //color: Colors.yellow,
          child: IconButton(
              iconSize: 65.0,
              icon: Icon(
                  Icons.image,
                  color: Colors.yellow)
          ),
        )
          ],
        ),
      )),
    );
  }

  Widget _showStickersHeader() {
    return Container(
        padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(g.PANEL_STICKERS),
              Divider(
                height: 15.0,
                color: Colors.grey,
              ),
            ]));
  }

  Widget _showUserStickers() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        child: Center(
            child: Container(
                /*child: GridView.custom(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3), shrinkWrap: true, physics: ScrollPhysics(), // to disable GridView's scrolling
                    childrenDelegate:
                    SliverChildListDelegate(List.generate(4, (index) {
                      return Container(
                        padding: EdgeInsets.all(20.0),
                        child: Center(
                          child: GridTile(
                            /*footer: Text(
                              'Item $index',
                              textAlign: TextAlign.center,
                            ),
                            header: Text(
                              'SubItem $index',
                              textAlign: TextAlign.center,
                            ),*/
                            child: Icon(Icons.bookmark,
                                size: 75.0, color: Colors.green),
                          ),
                        ),
                        color: Colors.blue[400],
                        margin: EdgeInsets.all(1.0),
                      );
                    }))),*/
                child: Wrap(children: <Widget>[
                    IconButton(
                    iconSize: 85.0,
                    icon: Icon(
                        Icons.bookmark,
                        //size: 100.0,
                        color: Colors.purple)
                ),
              IconButton(
                  iconSize: 85.0,
                  icon: Icon(
                      Icons.bookmark,
                      //size: 100.0,
                      color: Colors.blue)
              ),
              IconButton(
                  iconSize: 85.0,
                  icon: Icon(
                      Icons.bookmark,
                      //size: 100.0,
                      color: Colors.green)
              ),
              IconButton(
                  iconSize: 85.0,
                  icon: Icon(
                      Icons.bookmark,
                      //size: 100.0,
                      color: Colors.yellow)
              ),
              ]
                /*child: GridView.count(
          crossAxisCount: 3,
          physics: ScrollPhysics(), // to disable GridView's scrolling
          shrinkWrap: true,
          children: <Widget>[
            IconButton(
                iconSize: 75.0,
                icon: Icon(
                    Icons.bookmark,
                    //size: 100.0,
                    color: Colors.purple)
            ),
            IconButton(
                iconSize: 75.0,
                icon: Icon(
                    Icons.bookmark,
                    //size: 100.0,
                    color: Colors.blue)
            ),
            IconButton(
                iconSize: 75.0,
                icon: Icon(
                    Icons.bookmark,
                    //size: 100.0,
                    color: Colors.green)
            ),
            IconButton(
                iconSize: 75.0,
                icon: Icon(
                    Icons.bookmark,
                    //size: 100.0,
                    color: Colors.yellow)
            ),*/
            /*FlatButton(
              padding: const EdgeInsets.all(0.0),
            child: Icon(
              Icons.bookmark,
              size: 100.0,
              color: Colors.purple)
            ),
            FlatButton(child: Icon(
              Icons.bookmark,
              size: 100.0,
              color: Colors.blue)
            ),
            FlatButton(child: Icon(
                Icons.bookmark,
                size: 100.0,
                color: Colors.green)
            ),
            FlatButton(child: Icon(
                Icons.bookmark,
                size: 100.0,
                color: Colors.yellow)
            ),*/
          //],
        )
        )));
  }

  Widget _showSearchInputAndButtons() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
        child: new Wrap(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                width: 250.0,
                child: TextFormField(
                  controller: _textEditingController,
                  maxLines: 1,
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  decoration: new InputDecoration(
                    hintText: 'buscar',
                    /*icon: new Icon(
                        Icons.search,
                        color: Colors.grey,
                      )*/
                  ),
                  validator: (value) =>
                      value.isEmpty ? 'El texto no pueder estar vacío' : null,
                  onSaved: (value) => _barcode = value,
                )),
            Container(
                width: 50.0,
                child: FlatButton(
                    child: Icon(
                      Icons.search,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      var res = _validateAndSubmit();
                      res.then((value) {
                        _offObject.then((value) {
                          setState(() {
                            _offObjectCaptured = value;
                          });

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  ProductoPage(offObject: _offObjectCaptured)));
                        });
                      });
                    })),
            Container(
                width: 50.0,
                child: FlatButton(
                    child: Icon(
                      font_awesome_flutter.FontAwesomeIcons.barcode,
                      color: Colors.green,
                    ),
                    //onPressed: _validateAndSubmit,
                    onPressed: () {
                      var res = _scanQR();
                      res.then((value) {
                        _offObject.then((value) {
                          setState(() {
                            _offObjectCaptured = value;
                          });

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  ProductoPage(offObject: _offObjectCaptured)));
                        });
                      });
                    })),
          ],
        ));
  }

  Future<String> _validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
    });
    if (_validateAndSave()) {
      try {
        _getDataFromAPI();

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

  Future<String> _getDataFromAPI() async {
    setState(() {
      _offObject = _fetchOffObject();
      _textMessage = null;
    });

    return 'OK';
  }

  Future<OffObject> _fetchOffObject() async {
    //_barcode = '8412042502381'; // MORDARIZ 330 Ml
    //_barcode = '8411620001155'; // El Caserio
    _barcode = '8413993070103'; // ensaladilla
    final url = _baseUrl + _barcode + _baseUrlEnd;
    print(url);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      return OffObject.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Widget _showErrorMessage() {
    if (_errorMessage != null && _errorMessage.length > 0) {
      return new Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }

  Future<String> _scanQR() async {
    print('_scanQR');
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        _textEditingController.text = qrResult;
      });

      _validateAndSubmit();
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          _textEditingController.text = "Camera permission was denied";
        });
      } else {
        setState(() {
          _textEditingController.text = "Unknown error $e";
        });
      }
    } on FormatException {
      setState(() {
        _textEditingController.text =
            "You pressed the back button before scanning anything";
      });
    } catch (e) {
      setState(() {
        _textEditingController.text = "Unknown error $e";
      });
    }
  }

}
