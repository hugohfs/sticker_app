import 'package:flutter/material.dart';
import 'package:sticker_app/globals/globals.dart' as g;
import 'package:sticker_app/models/OpenFoodFacts/OffObject.dart';
import 'package:sticker_app/models/OpenFoodFacts/OffSearchResult.dart';
import 'package:sticker_app/pages/producto.dart';

class ListaProductosPage extends StatefulWidget {
  ListaProductosPage({Key key, this.offSearchResult}) : super(key: key);

  final OffSearchResult offSearchResult;

  @override
  State<StatefulWidget> createState() => new _ListaProductosPageState();
}

class _ListaProductosPageState extends State<ListaProductosPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(g.APPBAR_LISTA_PRODUCTOS_ENCONTRADOS),
      ),
      body: _showProductList(),
      /*floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showDialog(context);
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        )*/
    );
  }

  Widget _showProductList() {
    if (widget.offSearchResult.products != null && widget.offSearchResult.products.length > 0) {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: widget.offSearchResult.products.length,
          itemBuilder: (BuildContext context, int index) {
            String productName =
                widget.offSearchResult.products.elementAt(index).productName != null
                    ? widget.offSearchResult.products.elementAt(index).productName
                    : 'Nombre no registrado';
            Widget imageWidget = (widget.offSearchResult.products.elementAt(index).imageFrontSmallUrl != null)
            ? Image.network(widget.offSearchResult.products.elementAt(index).imageFrontSmallUrl)
                : null;
            String subtitleBrand = (widget.offSearchResult.products.elementAt(index).brands != null)
                ? widget.offSearchResult.products.elementAt(index).brands
                : '';
            String subtitleQuantity = (widget.offSearchResult.products.elementAt(index).quantity != null)
                ? widget.offSearchResult.products.elementAt(index).quantity
                : '';
            return Dismissible(
              key: Key(productName),
              background: Container(color: Colors.red),
              /*onDismissed: (direction) async {
                _deleteTodo(todoId, index);
              },*/
              child: ListTile(
                leading: Container(
                    width: 50.0,
                    child: imageWidget),
                title: Text(
                  productName,
                  style: TextStyle(fontSize: 20.0),
                ),
                subtitle: Text(subtitleBrand + ' - ' + subtitleQuantity),
                onTap: () {
                  OffObject off = new OffObject();
                  off.product = widget.offSearchResult.products.elementAt(index);

                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => ProductoPage(offObject: off)));
                },
                /*trailing: IconButton(
                    icon: (completed)
                        ? Icon(
                      Icons.done_outline,
                      color: Colors.green,
                      size: 20.0,
                    )
                        : Icon(Icons.done, color: Colors.grey, size: 20.0),
                    onPressed: () {
                      _updateTodo(_todoList[index]);
                    }),*/
              ),
            );
          });
    } else {
      return Center(
          child: Text(
        "No se han encontrado productos con el texto introducido.",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20.0),
      ));
    }
  }
}
