import 'dart:io';
import 'package:camara/Services/Foto.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Camare extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<Camare> {
  /// Variables
  File imageFile;
  final nombre = TextEditingController();
  final descrip = TextEditingController();
  Future<int> _add;
  @override
  void initState() {
    imageFile = null;
    super.initState();
  }

  /// Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Llene los campos correspondiente"),
          backgroundColor: Color.fromRGBO(244, 164, 96, 1),
        ),
        body: Center(
          child: Container(
              child: Column(
            children: [
              _foto_vacia(context),
              _fotografia(imageFile, context),
              Container(
                  margin: EdgeInsets.only(bottom: 5),
                  width: 440 * 0.85,
                  height: 50,
                  child: TextField(
                    controller: nombre,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nombre',
                    ),
                  )),
              Container(
                  margin: EdgeInsets.only(bottom: 5),
                  width: 440 * 0.85,
                  height: 50,
                  child: TextField(
                    controller: descrip,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Descripción',
                    ),
                  )),
              _boton(context)
            ],
          )),
        ));
  }

  /// abrir galeria
  _getFromGallery() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 420,
      maxHeight: 420,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  /// abrir camara
  _getFromCamera() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 420,
      maxHeight: 420,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  //enviar datos

  _enviar() async {
    if (imageFile != null && nombre.text != "" && descrip.text != "") {
      _add = Foto().add(imageFile, nombre.text, descrip.text);
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Se agrego correctamente"),
          duration: Duration(seconds: 1)));
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Error , llene los campos"),
          duration: Duration(seconds: 1)));
    }
    if (imageFile != null) {
      setState(() {
        nombre.clear();
        descrip.clear();
        imageFile = null;
        build(context);
      });
    }
  }

  /// visualizacion de la fotografia
  Widget _fotografia(File imageFile, BuildContext context) {
    return imageFile == null
        ? Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  textColor: Colors.white,
                  color: Color.fromRGBO(30, 144, 255, 1),
                  onPressed: () {
                    _getFromGallery();
                  },
                  child: Text("Ingresar a la galeria"),
                ),
                Container(
                  width: 10,
                  height: 2.0,
                ),
                RaisedButton(
                  textColor: Colors.white,
                  color: Color.fromRGBO(30, 144, 255, 1),
                  onPressed: () {
                    _getFromCamera();
                  },
                  child: Text("Ingresar a la camara"),
                )
              ],
            ),
          )
        : Container(
            margin: const EdgeInsets.all(22.0),
            child: Image.file(
              imageFile,
              fit: BoxFit.cover,
            ),
          );
  }

  // boton enviar
  Widget _boton(BuildContext context) {
    return Container(
      width: 442 * 0.85,
      child: new RaisedButton(
        padding:
            const EdgeInsets.only(top: 7, left: 100, right: 100, bottom: 10),
        textColor: Colors.white,
        color: Colors.blue,
        onPressed: () {
          _enviar();
        },
        child: new Text("Enviar"),
      ),
    );
  }

  // foto por defecto
  Widget _foto_vacia(BuildContext context) {
    return imageFile == null
        ? Container(
            margin: const EdgeInsets.all(30.0),
            width: 350.0,
            height: 350.0,
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage("assets/img/vacio.jpg"),
                    fit: BoxFit.cover)),
          )
        : Container();
  }
}
