import 'package:backgapi/splash.dart';
import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
    }
  )
);
