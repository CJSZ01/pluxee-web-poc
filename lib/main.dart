import 'package:flutter/material.dart';
import 'package:pluxee_web_poc/core/navigation/routes.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Pluxee Web POC',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'plx'),
      routes: Navigation.routing,
    ),
  );
}
