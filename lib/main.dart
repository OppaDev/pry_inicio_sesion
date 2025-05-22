import 'package:flutter/material.dart';
import 'package:pry_inicio_sesion/view/login_page.dart';
import './themes/app_themes.dart';
import './view/registro_page.dart';
import './view/welcome.dart';


void main() {
  runApp(MaterialApp(
    title: 'Iniciar Sesion',
    initialRoute: '/',
    routes: {
      '/': (context) => LoginPage(),
      '/registro': (context) => RegistroPage(),
      '/Bienvenido': (context) => WelcomePage(),
    },
    theme: AppThemes.lightTheme,
    debugShowCheckedModeBanner: false,
  ));
}