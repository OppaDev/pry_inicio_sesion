import 'package:flutter/material.dart';

class LoginController {
  // declaracion de metodo
  String? validarUsuario(String? value) {
    //codigo de validacion
    if (value == null || value.isEmpty) return 'El usuario no puede estar vacio';
    return null;
  }
  //validar password
  String? validarPassword(String? value) {
    //codigo de validacion
    if (value == null || value.length < 10) return 'La contraseña debe tener al menos 10 caracteres';
    return null;
  }

  //iniciar sesion
  void iniciarSesion(BuildContext context, String username, String password) {
    //codigo de inicio de sesion
    if (username == 'leonardo' && password == '1234567890') {
      Navigator.pushNamed(context, '/Bienvenido', arguments: username);
    } else {
      //codigo de error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Usuario o contraseña incorrectos'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
