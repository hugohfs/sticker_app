import 'package:firebase_database/firebase_database.dart';

class Usuario {
  String key;
  String nombre;
  String correo;
  List<String> historialProductos;

  //Rol rol;

  Usuario(this.nombre, this.correo, this.historialProductos);

  Usuario.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        nombre =
        snapshot.value["nombre"] != null ? snapshot.value["nombre"] : null,
        correo =
        snapshot.value["correo"] != null ? snapshot.value["correo"] : null,
        historialProductos =
        snapshot.value["historialProductos"] != null ? snapshot.value["historialProductos"].cast<String>(): null;


  toJson() {
    return {
      "nombre": nombre,
      "correo": correo,
      "historialProductos": historialProductos
    };
  }

  Usuario.fromJson(Map json){
    this.nombre = json.containsKey('historialProductos') == true
        ? json["nombre"]
        : null;
    this.correo = json.containsKey('historialProductos') == true
        ? json["correo"]
        : null;
    this.historialProductos = json.containsKey('historialProductos') == true
        ? json['historialProductos'].cast<String>()
        : null;
  }

}
