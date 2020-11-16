import 'package:camara/Views/Tabs.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{'home': (BuildContext context) => Tabs()};
}
