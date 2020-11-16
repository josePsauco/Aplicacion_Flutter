import 'package:camara/Views/Home.dart';
import 'package:camara/Views/List.dart';
import 'package:flutter/material.dart';

import 'Camare.dart';

// menu tabr
class Tabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: 3,
        child: new Scaffold(
          appBar: new AppBar(
            bottom: new TabBar(indicatorColor: Colors.black, tabs: <Widget>[
              new Tab(
                icon: new Icon(Icons.home),
                text: "Inicio",
              ),
              new Tab(
                icon: new Icon(Icons.add_a_photo_outlined),
                text: "Agregar",
              ),
              new Tab(
                icon: new Icon(Icons.article),
                text: "Lista",
              )
            ]),
          ),
          body: new TabBarView(
            children: <Widget>[new Home(), new Camare(), new ListC()],
          ),
        ));
  }
}
