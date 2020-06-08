import 'package:firebase_database/firebase_database.dart';
import 'package:sticker_app/globals/globals.dart' as g;

class ProductoHistorico {
  String key;
  String productoId;
  DateTime fecha;

  //Rol rol;

  ProductoHistorico(this.productoId, this.fecha);

  ProductoHistorico.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        productoId =
          snapshot.value["productoId"] != null ? snapshot.value["productoId"] : null,
        fecha =
          snapshot.value["fecha"] != null ? g.dateFormat.parse(snapshot.value["fecha"]) : null;


  toJson() {
    return {
      "productoId": productoId,
      "fecha": fecha
    };
  }

  ProductoHistorico.fromJson(Map json){
    this.productoId = json.containsKey('historialProductos') == true
        ? json["productoId"]
        : null;
    this.fecha = json.containsKey('historialProductos') == true
        ? g.dateFormat.parse(json["fecha"])
        : null;
  }

}
