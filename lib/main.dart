import 'package:first_project/choose_location.dart';
import 'package:first_project/home.dart';
import 'package:first_project/loading.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation()
  },
));
