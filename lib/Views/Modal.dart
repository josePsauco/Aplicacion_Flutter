import 'package:camara/Models/Foto.dart';
import 'package:camara/Services/Foto.dart';
import 'package:flutter/material.dart';

class Modal extends StatelessWidget {
  Modal({this.carta, this.index});
  Future<String> mensaje;
  final Foto_m carta;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(carta.getNombre() + "$index"),
          backgroundColor: Color.fromRGBO(244, 164, 96, 1),
        ),
        body: Center(
          child: Container(
              margin: EdgeInsets.all(10),
              child: Column(children: [
                Column(children: [
                  _foto_web(context, carta.getRuta()),
                  _boton(context, carta.getId()),
                  _texto1(carta.getDescripcion(), 5, 16, 17),
                  _texto1(
                      "Ya tienes un repositorio con una copia de tus imagenes cargadas en galeria o tomadas por la camara. El siguiente paso es realizar algunos cambios y confirmar instantáneas de esos cambios en el repositorio ten en cuenta que se conservara cualquier tipo de modificación.",
                      66,
                      27,
                      152),
                  _foto_public(context)
                ])
              ])),
        ));
  }

// ruta web
  Widget _foto_web(BuildContext context, String img) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.24,
      decoration: new BoxDecoration(
          image: new DecorationImage(image: new NetworkImage(img))),
    );
  }

  // con ruta a los archivos
  Widget _foto_public(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0.1),
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.24,
      decoration: new BoxDecoration(
          image: new DecorationImage(
              image: new AssetImage(
                  "assets/img/eliminar-desindexar-url-google.png"))),
    );
  }

  // boton enviar
  Widget _boton(BuildContext context, int id) {
    return Container(
      width: 390 * 0.85,
      child: new RaisedButton(
        padding: const EdgeInsets.only(top: 7, left: 80, right: 80, bottom: 10),
        textColor: Colors.white,
        color: Colors.blue,
        onPressed: () {
          mensaje = Foto().delete(id);
          Navigator.pop(context);
        },
        child: new Text("Eliminar"),
      ),
    );
  }

  Widget _texto1(String texto, int r, int g, int b) {
    return Container(
        padding: EdgeInsets.only(bottom: 5, top: 4, left: 30, right: 30),
        child: Text(texto,
            softWrap: true,
            textAlign: TextAlign.justify,
            style: TextStyle(
                fontSize: 10.0,
                color: Color.fromRGBO(r, g, b, 1),
                fontFamily: "Caveat",
                fontWeight: FontWeight.w700)));
  }
}
