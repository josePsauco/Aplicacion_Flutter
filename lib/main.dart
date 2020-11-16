import 'package:camara/Util/Routers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'App Fotos',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'home',
      routes: getRoutes(),
    );
  }
}
