// ignore: camel_case_types
class Foto_m {
  //Constructor
  Foto_m(this._id, this._descripcion, this._ruta, this._nombre);

  //Variables igual a la BBDD
  int _id;
  String _descripcion;
  String _ruta;
  String _nombre;

  //Getters
  getId() => this._id;
  getDescripcion() => this._descripcion;
  getRuta() => this._ruta;
  getNombre() => this._nombre;

  //Settes
  void setDescripcion(String descripcion) {
    _descripcion = descripcion;
  }

  void setRuta(String ruta) {
    _ruta = ruta;
  }

  void setNombre(String nombre) {
    _nombre = nombre;
  }

  // Serealizado
  Foto_m.fromJson(Map<String, dynamic> json) {
    _id = json["id"];
    _descripcion = json["descripcion"];
    _ruta = json["ruta"];
    _nombre = json["nombre"];
  }
}
