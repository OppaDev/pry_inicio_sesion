import 'package:flutter/material.dart';
import 'package:pry_inicio_sesion/view/login_page.dart';
import './themes/app_themes.dart';


void main() {
  runApp(MaterialApp(
    title: 'Iniciar Sesion',
    initialRoute: '/',
    routes: {
      '/': (context) => LoginPage(),
    },
    theme: AppThemes.lightTheme,
    debugShowCheckedModeBanner: false,
  ));
}