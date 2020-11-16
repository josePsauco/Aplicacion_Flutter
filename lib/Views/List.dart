import 'package:camara/Services/Foto.dart';
import 'package:camara/Models/Foto.dart';
import 'package:camara/Views/Modal.dart';
import 'package:flutter/material.dart';

class ListC extends StatefulWidget {
  @override
  _ListCState createState() => _ListCState();
}

class _ListCState extends State<ListC> {
  Future<List> _lista;
  @override
  void initState() {
    _lista = Foto().getFotos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
      child: FutureBuilder<List>(
        future: _lista,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  var foto = snapshot.data[index];
                  return Container(
                    child: Column(children: <Widget>[
                      _carta(context, foto, index),
                    ]),
                  );
                });
          } else {
            return Container(
              child: Column(
                children: [Text("")],
              ),
            );
          }
        },
      ),
    ));
  }

  // foto
  Widget _foto(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      width: 350.0,
      height: 350.0,
      decoration: new BoxDecoration(
          image: new DecorationImage(
              image: new AssetImage("assets/img/IMG-20201104-WA0011.jpg"),
              fit: BoxFit.cover)),
    );
  }

// cartas
  Widget _carta(BuildContext context, Foto_m carta, int index) {
    return new Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.5,
        child: Card(
          child: Column(
            children: <Widget>[
              new Hero(
                tag: carta.getNombre() + "$index",
                child: Material(
                  child: InkWell(
                    onTap: () async {
                      await Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) {
                        return new Modal(carta: carta, index: index);
                      }));
                      setState(() {
                        _lista = Foto().getFotos();
                        build(context);
                      });
                    },
                    child: Image.network(carta.getRuta()),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.all(0.1),
              ),
              new Text(
                carta.getNombre() + "$index",
                style: new TextStyle(fontSize: 20.0),
              ),
            ],
          ),
        ));
  }
}
