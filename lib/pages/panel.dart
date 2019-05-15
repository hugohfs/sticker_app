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

class OpenFoodFactsPage extends StatefulWidget {
  /*OpenFoodFactsPage({Key key, this.auth, this.userId, this.onSignedOut})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;*/

  @override
  State<StatefulWidget> createState() => new _OpenFoodFactsPageState();
}

class _OpenFoodFactsPageState extends State<OpenFoodFactsPage> {
  String _textMessage;
  Future<OffObject> _offObject;

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
            padding: EdgeInsets.all(15.0),
            child: new Form(
              key: _formKey,
              child: new ListView(
                shrinkWrap: true,
                children: <Widget>[
                  //_showButtonGetFromLocalFile(),
                  _showSearchInputAndButtons(),
                  //_showButtonGetFromAPI(),
                  _showHistoryHeader(),
                  _showHistoryProducts(),
                  _showSuggestedHeader(),
                  _showSuggestedProducts(),
                  _showStickersHeader(),
                  _showUserStickers(),
                  _showErrorMessage(),
                  _showTextResult(),
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
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child: Center(
          child: Container(
        //margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
        //margin: EdgeInsets.symmetric(vertical: 10.0),
        height: 85.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
              width: 85.0,
              color: Colors.purple,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
              width: 85.0,
              color: Colors.blue,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
              width: 85.0,
              color: Colors.green,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
              width: 85.0,
              color: Colors.yellow,
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
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child: Center(
          child: Container(
        //margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
        //margin: EdgeInsets.symmetric(vertical: 10.0),
        height: 85.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
              width: 85.0,
              color: Colors.purple,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
              width: 85.0,
              color: Colors.blue,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
              width: 85.0,
              color: Colors.green,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
              width: 85.0,
              color: Colors.yellow,
            ),
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
        padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
        child: Center(
            child: Container(
                child: GridView.count(
          crossAxisCount: 3,
          //physics: ScrollPhysics(), // to disable GridView's scrolling
          shrinkWrap: true,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 10.0),
              width: 100.0,
              color: Colors.purple,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 10.0),
              width: 100.0,
              color: Colors.blue,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 10.0),
              width: 100.0,
              color: Colors.green,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 10.0),
              width: 100.0,
              color: Colors.yellow,
            ),
          ],
        ))));
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
                    onPressed: _validateAndSubmit)),
            Container(
                width: 50.0,
                child: FlatButton(
                    child: Icon(
                      font_awesome_flutter.FontAwesomeIcons.barcode,
                      color: Colors.green,
                    ),
                    //onPressed: _validateAndSubmit,
                    onPressed: () {
                      _scanQR();
                    })),
          ],
        ));
  }

  Widget _showButtonGetFromAPI() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child: Center(
          child: RaisedButton(
        elevation: 5.0,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        color: Colors.blue,
        child: Text('Get data from Open Food Facts API',
            style: new TextStyle(fontSize: 20.0, color: Colors.white)),
        onPressed: _validateAndSubmit,
      )),
    );
  }

  void _validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
    });
    if (_validateAndSave()) {
      try {
        _getDataFromAPI();
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

  Widget _showTextResult() {
    if (_offObject != null) {
      return Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          child: FutureBuilder<OffObject>(
            future: _offObject,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return _showProductInfo(snapshot);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner
              return CircularProgressIndicator();
            },
          ));
    } else if (_textMessage != null && _textMessage.length > 0) {
      return Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          child: new Text(
            _textMessage,
            style: TextStyle(
                fontSize: 13.0,
                color: Colors.black,
                height: 1.0,
                fontWeight: FontWeight.w400),
          ));
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }

  Column _showProductInfo(AsyncSnapshot<OffObject> snapshot) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
        Widget>[
      Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          child: Wrap(children: <Widget>[
            (snapshot.data.product != null &&
                    snapshot.data.product.imageFrontSmallUrl != null)
                ? Image.network(snapshot.data.product.imageFrontSmallUrl)
                : Image.asset('assets/not_found.png')
          ])),
      Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
          child: new Wrap(children: <Widget>[
            Text("Creator: ", style: TextStyle(fontWeight: FontWeight.bold)),
            Text((snapshot.data.product != null &&
                    snapshot.data.product.creator != null)
                ? snapshot.data.product.creator.toString()
                : "No data found")
          ])),
      Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
          child: new Wrap(children: <Widget>[
            Text("Generic Name: ",
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text((snapshot.data.product != null &&
                    snapshot.data.product.genericName != null)
                ? snapshot.data.product.genericName
                : "No data found")
          ])),
      Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
          child: new Wrap(children: <Widget>[
            Text("Product Name: ",
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text((snapshot.data.product != null &&
                    snapshot.data.product.productName != null)
                ? snapshot.data.product.productName
                : "No data found")
          ])),
      Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
          child: new Wrap(children: <Widget>[
            Text("Ingredients text: ",
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text((snapshot.data.product != null &&
                    snapshot.data.product.ingredientsText != null)
                ? snapshot.data.product.ingredientsText
                : "No data found")
          ])),
      Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
          child: new Wrap(children: <Widget>[
            Text("Nutriscore: ", style: TextStyle(fontWeight: FontWeight.bold)),
            (snapshot.data.product != null &&
                    snapshot.data.product.nutritionGrades != null)
                ? snapshot.data.product.nutritionGrades == 'a'
                    ? Image.asset('assets/nutriscore-a.png')
                    : snapshot.data.product.nutritionGrades == 'b'
                        ? Image.asset('assets/nutriscore-b.png')
                        : snapshot.data.product.nutritionGrades == 'c'
                            ? Image.asset('assets/nutriscore-c.png')
                            : snapshot.data.product.nutritionGrades == 'd'
                                ? Image.asset('assets/nutriscore-d.png')
                                : snapshot.data.product.nutritionGrades == 'e'
                                    ? Image.asset('assets/nutriscore-e.png')
                                    : Image.asset('assets/not_found.png')
                : (snapshot.data.product != null &&
                        snapshot.data.product.nutritionGradeFr != null)
                    ? snapshot.data.product.nutritionGradeFr == 'a'
                        ? Image.asset('assets/nutriscore-a.png')
                        : snapshot.data.product.nutritionGradeFr == 'b'
                            ? Image.asset('assets/nutriscore-b.png')
                            : snapshot.data.product.nutritionGradeFr == 'c'
                                ? Image.asset('assets/nutriscore-c.png')
                                : snapshot.data.product.nutritionGradeFr == 'd'
                                    ? Image.asset('assets/nutriscore-d.png')
                                    : snapshot.data.product.nutritionGradeFr ==
                                            'e'
                                        ? Image.asset('assets/nutriscore-e.png')
                                        : Image.asset('assets/not_found.png')
                    : Image.asset('assets/not_found.png')
          ])),
    ]);
  }

  _getDataFromAPI() {
    setState(() {
      _offObject = _fetchOffObject();
      _textMessage = null;
    });
  }

  Future<OffObject> _fetchOffObject() async {
    //_barcode = '8412042502381'; // MORDARIZ 330 Ml
    //_barcode = '8411620001155'; // El Caserio
    //_barcode = '8413993070103'; // ensaladilla
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

  Future _scanQR() async {
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

  Widget _showButtonGetFromLocalFile() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child: Center(
          child: RaisedButton(
        elevation: 5.0,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        color: Colors.blue,
        child: Text('Get data from Local File',
            style: new TextStyle(fontSize: 20.0, color: Colors.white)),
        onPressed: () {
          _getDataFromFile(context);
        },
      )),
    );
  }

  _getDataFromFile(BuildContext context) async {
    // WAY 1
    String jsonString = "";
    jsonString = await DefaultAssetBundle.of(context)
        .loadString("assets/Open_Food_Facts_JSON_Example_HFS.json");
    //print("jsonString:" + jsonString);

    Map userMap = jsonDecode(jsonString);
    var model = OffObject.fromJson(userMap);
    //print(model.product.genericNameFr);

    // WAY 2
    Map<String, dynamic> dmap = await DefaultAssetBundle.of(context)
        .loadString("assets/Open_Food_Facts_JSON_Example_HFS.json")
        .then((jsonStr) => jsonDecode(jsonStr));
    //print(dmap);

    OffObject offModel = new OffObject.fromJson(dmap);
    //print(offModel.product.genericNameFr);

    setState(() {
      _textMessage = "genericName: " +
          model.product.genericName +
          "\n\n" +
          "ingredientsText: " +
          model.product.ingredientsText +
          "\n\n" +
          "nutriments: " +
          model.product.nutriments.toString();
      //_textMessage = offModel.product.nutriments.toString();
      _offObject = null;
    });
  }
}
