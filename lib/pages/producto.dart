import 'package:flutter/material.dart';
import 'package:sticker_app/models/OpenFoodFacts/OffObject.dart';
import 'package:sticker_app/globals/globals.dart' as g;

class ProductoPage extends StatefulWidget {
  ProductoPage({Key key, this.offObject}) : super(key: key);

  final OffObject offObject;

  @override
  State<StatefulWidget> createState() => new _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  String _textMessage;
  String _errorMessage;

  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: g.PRODUCTO_TAB_PRODUCTO, icon: Icon(Icons.fastfood)),
                Tab(
                    text: g.PRODUCTO_TAB_COMPOSICION,
                    icon: Icon(Icons.playlist_add_check)),
                Tab(text: g.PRODUCTO_TAB_INFORMACION, icon: Icon(Icons.info)),
              ],
            ),
            title: Text(g.APPBAR_PRODUCTO),
          ),
          body: TabBarView(
            children: [
              _showProductTab(),
              _showComposicionTab(),
              _showInformacionTab(),
            ],
          ),
        ),
      ),
    );
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

  Widget _showProductTab() {
    if (widget.offObject != null) {
      return Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          child: _showProductInfo(widget.offObject));
    } else if (_textMessage != null && _textMessage.length > 0) {
      return Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
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

  Widget _showProductInfo(OffObject _offObject) {
    return ListView(
        shrinkWrap: true,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              child: Center(child: Wrap(children: <Widget>[
                (_offObject.product != null &&
                        _offObject.product.imageFrontSmallUrl != null)
                    ? Image.network(_offObject.product.imageFrontSmallUrl)
                    : Image.asset('assets/not_found.png')
              ]))),
          Padding(padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),),
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
          Padding(padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),),
          Center(
              child: Container(
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
                          iconSize: 75,
                          icon: Icon(
                              Icons.bookmark,
                              //size: 100.0,
                              color: Colors.purple)
                      ),
                      IconButton(
                          iconSize: 75,
                          icon: Icon(
                              Icons.bookmark,
                              //size: 100.0,
                              color: Colors.blue)
                      ),
                      IconButton(
                          iconSize: 75,
                          icon: Icon(
                              Icons.bookmark,
                              //size: 100.0,
                              color: Colors.green)
                      ),
                      IconButton(
                          iconSize: 75,
                          icon: Icon(
                              Icons.bookmark,
                              //size: 100.0,
                              color: Colors.yellow)
                      ),
                    ],*/
                  )))
        ]);
  }

  Widget _showComposicionTab() {
    if (widget.offObject != null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        child: _showComposicionInfo(widget.offObject),
      );
    } else if (_textMessage != null && _textMessage.length > 0) {
      return Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
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

  Widget _showComposicionInfo(OffObject _offObject) {
    return ListView(
        shrinkWrap: true,
        children: <Widget>[
      Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
          child: new Wrap(children: <Widget>[
            //Text("Nutriscore: ", style: TextStyle(fontWeight: FontWeight.bold)),
            Center(
                child: (_offObject.product != null &&
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
                                            ? Image.asset(
                                                'assets/nutriscore-e.png')
                                            : Image.asset(
                                                'assets/not_found.png')
                        : Image.asset('assets/not_found.png'))
          ])),
      Text(
        'Ingredientes',
        textAlign: TextAlign.start,
      ),
      Divider(),
      Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
          child: new Wrap(children: <Widget>[
            Text((_offObject.product != null &&
                    _offObject.product.ingredientsText != null)
                ? _offObject.product.ingredientsText
                : "No data found")
          ])),
    ]);
  }

  Widget _showInformacionTab() {
    if (widget.offObject != null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        child: _showInformacionInfo(widget.offObject),
      );
    } else if (_textMessage != null && _textMessage.length > 0) {
      return Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
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

  Widget _showInformacionInfo(OffObject _offObject) {
    return ListView(
        shrinkWrap: true,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
              child: new Wrap(children: <Widget>[
                Text("Creator: ",
                    style: TextStyle(fontWeight: FontWeight.bold)),
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
                Text("Brands: ", style: TextStyle(fontWeight: FontWeight.bold)),
                Text((_offObject.product != null &&
                        _offObject.product.brands != null)
                    ? _offObject.product.brands
                    : "No data found")
              ])),
        ]);
  }
}
