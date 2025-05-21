import 'package:flutter/material.dart';
import './themes/app_themes.dart';


void main() {
  runApp(MaterialApp(
    title: 'Iniciar Sesion',
    initialRoute: '/',
    routes: {
    },
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    theme: AppThemes.lightTheme,
    debugShowCheckedModeBanner: false,
  ));
}