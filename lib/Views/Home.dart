import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Column(
            children: [
              _texto(),
              _foto(context),
              _texto1(
                  "Este proyecto fue realizado con la tecnología flutter y nodejs, posteriormente se realizo su despliegue en la nube Amazon con la configuraciones básicas vistas en clase.")
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Expanded(
                child: Column(
              children: [
                Icon(Icons.access_alarm),
                _texto1(
                    "El tiempo invertido de flutter no es tan extenso siempre y cuando tenga buenos conceptos de POO"),
              ],
            )),
            Expanded(
                child: Column(
              children: [
                Icon(Icons.account_balance_wallet_outlined),
                _texto1(
                    "El despliegue de la aplicación esta divida en dos máquinas: una que posee el backend y la otra el bd."),
              ],
            )),
            Expanded(
                child: Column(
              children: [
                Icon(Icons.article),
                _texto1(
                    "El proyecto se encuentra en el repositorio git. Contacto: josemanoloph@ufps.edu.co"),
              ],
            )),
          ])
        ],
      ),
    )));
  }

  // foto de inicio
  Widget _foto(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      width: 350.0,
      height: 350.0,
      decoration: new BoxDecoration(
          image: new DecorationImage(
              image: new AssetImage("assets/img/Sin título.png"),
              fit: BoxFit.cover)),
    );
  }

  Widget _texto() {
    return Text("Aplicación Flutter ",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 40.0,
            color: Colors.blue,
            fontFamily: "Caveat",
            fontWeight: FontWeight.w700));
  }

  Widget _texto1(String texto) {
    return Container(
        padding: EdgeInsets.only(bottom: 10, top: 4, left: 20, right: 20),
        child: Text(texto,
            softWrap: true,
            textAlign: TextAlign.justify,
            style: TextStyle(
                fontSize: 10.0,
                color: Colors.blue,
                fontFamily: "Caveat",
                fontWeight: FontWeight.w700)));
  }
}
