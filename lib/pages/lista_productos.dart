import 'package:flutter/material.dart';
import 'package:sticker_app/globals/globals.dart' as g;
import 'package:sticker_app/models/OpenFoodFacts/OffSearchResult.dart';

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
        title: Text(g.APPBAR_LISTA_PRODUCTOS),
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
    if (widget.offSearchResult.products.length > 0) {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: widget.offSearchResult.products.length,
          itemBuilder: (BuildContext context, int index) {
            String productName = widget.offSearchResult.products.elementAt(index).productName != null ? widget.offSearchResult.products.elementAt(index).productName  : 'Nombre no encontrado';
            /*String todoId = _todoList[index].key;
            String subject = _todoList[index].subject;
            bool completed = _todoList[index].completed;
            String userId = _todoList[index].userId;*/
            return Dismissible(
              key: Key(productName),
              background: Container(color: Colors.red),
              /*onDismissed: (direction) async {
                _deleteTodo(todoId, index);
              },*/
              child: ListTile(
                title: Text(
                  productName,
                  style: TextStyle(fontSize: 20.0),
                ),
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
      return Center(child: Text("No se han encontrado productos con el texto introducido.",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20.0),));
    }
  }

}
