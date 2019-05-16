
import 'package:flutter/material.dart';
import 'package:sticker_app/models/OpenFoodFacts/OffObject.dart';

class ProductoPage extends StatefulWidget {
  ProductoPage({Key key, this.offObject})
      : super(key: key);

  final Future<OffObject> offObject;

  @override
  State<StatefulWidget> createState() => new _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  String _textMessage;
  //Future<OffObject> _offObject;

  final _formKey = new GlobalKey<FormState>();
  String _errorMessage;

  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
            padding: EdgeInsets.all(15.0),
            child: new Form(
              key: _formKey,
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
          child: FutureBuilder<OffObject>(
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

}