
import 'package:flutter/material.dart';
import 'package:sticker_app/models/OpenFoodFacts/OffObject.dart';
import 'package:sticker_app/globals/globals.dart' as g;

class ProductoPage extends StatefulWidget {
  ProductoPage({Key key, this.offObject})
      : super(key: key);

  final OffObject offObject;

  @override
  State<StatefulWidget> createState() => new _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  String _textMessage;
  String _errorMessage;

  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: Text(g.APPBAR_PRODUCTO)),
        body: new Container(
            padding: EdgeInsets.all(15.0),
            child: new Form(
              child: new ListView(
                shrinkWrap: true,
                children: <Widget>[
                  _showErrorMessage(),
                  _showTextResult(),
                ],
              ),
            )));
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

  Widget _showTextResult() {
    if (widget.offObject != null) {
      return Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          child: _showProductInfo(widget.offObject),
          /*child: FutureBuilder<OffObject>(
            future: widget.offObject,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return _showProductInfo(snapshot);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner
              return CircularProgressIndicator();
            },
          )*/);
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

  Column _showProductInfo(OffObject _offObject) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
        Widget>[
      Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          child: Wrap(children: <Widget>[
            (_offObject.product != null &&
                _offObject.product.imageFrontSmallUrl != null)
                ? Image.network(_offObject.product.imageFrontSmallUrl)
                : Image.asset('assets/not_found.png')
          ])),
      Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
          child: new Wrap(children: <Widget>[
            Text("Creator: ", style: TextStyle(fontWeight: FontWeight.bold)),
            Text((_offObject.product != null &&
                _offObject.product.creator != null)
                ? _offObject.product.creator.toString()
                : "No data found")
          ])),
      Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
          child: new Wrap(children: <Widget>[
            Text("Generic Name: ",
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text((_offObject.product != null &&
                _offObject.product.genericName != null)
                ? _offObject.product.genericName
                : "No data found")
          ])),
      Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
          child: new Wrap(children: <Widget>[
            Text("Product Name: ",
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text((_offObject.product != null &&
                _offObject.product.productName != null)
                ? _offObject.product.productName
                : "No data found")
          ])),
      Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
          child: new Wrap(children: <Widget>[
            Text("Ingredients text: ",
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text((_offObject.product != null &&
                _offObject.product.ingredientsText != null)
                ? _offObject.product.ingredientsText
                : "No data found")
          ])),
      Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
          child: new Wrap(children: <Widget>[
            Text("Nutriscore: ", style: TextStyle(fontWeight: FontWeight.bold)),
            (_offObject.product != null &&
                _offObject.product.nutritionGrades != null)
                ? _offObject.product.nutritionGrades == 'a'
                ? Image.asset('assets/nutriscore-a.png')
                : _offObject.product.nutritionGrades == 'b'
                ? Image.asset('assets/nutriscore-b.png')
                : _offObject.product.nutritionGrades == 'c'
                ? Image.asset('assets/nutriscore-c.png')
                : _offObject.product.nutritionGrades == 'd'
                ? Image.asset('assets/nutriscore-d.png')
                : _offObject.product.nutritionGrades == 'e'
                ? Image.asset('assets/nutriscore-e.png')
                : Image.asset('assets/not_found.png')
                : (_offObject.product != null &&
                _offObject.product.nutritionGradeFr != null)
                ? _offObject.product.nutritionGradeFr == 'a'
                ? Image.asset('assets/nutriscore-a.png')
                : _offObject.product.nutritionGradeFr == 'b'
                ? Image.asset('assets/nutriscore-b.png')
                : _offObject.product.nutritionGradeFr == 'c'
                ? Image.asset('assets/nutriscore-c.png')
                : _offObject.product.nutritionGradeFr == 'd'
                ? Image.asset('assets/nutriscore-d.png')
                : _offObject.product.nutritionGradeFr ==
                'e'
                ? Image.asset('assets/nutriscore-e.png')
                : Image.asset('assets/not_found.png')
                : Image.asset('assets/not_found.png')
          ])),
    ]);
  }

}