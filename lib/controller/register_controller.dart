import 'package:flutter/material.dart';
import '../model/usuario_model.dart';

class RegisterController {
  // declaracion de metodo
  String? validarUsuario(String? value) {
    //codigo de validacion
    if (value == null || value.isEmpty)
      return 'El usuario no puede estar vacio';
    return null;
  }

  //validar password
  String? validarPassword(String? value) {
    //codigo de validacion
    if (value == null || value.length < 10)
      return 'La contraseña debe tener al menos 10 caracteres';
    return null;
  }

  //validar Nombre
  String? validarNombre(String? value) {
    //codigo de validacion
    if (value == null || value.isEmpty) return 'El nombre no puede estar vacio';
    return null;
  }

  //validar Apellido
  String? validarApellido(String? value) {
    //codigo de validacion
    if (value == null || value.isEmpty)
      return 'El apellido no puede estar vacio';
    return null;
  }

  //validar ciudad
  String? validarCiudad(String? value) {
    //codigo de validacion
    if (value == null || value.isEmpty) return 'La ciudad no puede estar vacia';
    return null;
  }

  //validar provincia
  String? validarProvincia(String? value) {
    //codigo de validacion
    if (value == null || value.isEmpty)
      return 'La provincia no puede estar vacia';
    return null;
  }

  //validar email
  String? validarEmail(String? value) {
    //codigo de validacion
    if (value == null || value.isEmpty) return 'El email no puede estar vacio';
    return null;
  }

  //validar telefono
  String? validarTelefono(String? value) {
    //codigo de validacion
    if (value == null || value.isEmpty)
      return 'El telefono no puede estar vacio';
    return null;
  }

  //validar codigo postal
  String? validarCodigoPostal(String? value) {
    // Verificar que no sea null o vacío
    if (value == null || value.isEmpty) {
      return 'El código postal no puede estar vacío';
    }

    // Limpiar espacios en blanco
    value = value.trim();

    // Verificar formato: exactamente 6 dígitos
    final regex = RegExp(r'^[0-9]{6}$');
    if (!regex.hasMatch(value)) {
      return 'El código postal debe tener exactamente 6 dígitos';
    }

    // Convertir a entero para validaciones numéricas
    final codigo = int.parse(value);

    // Verificar rango general válido para Ecuador
    if (codigo < 10101 || codigo > 240804) {
      return 'El código postal no está en el rango válido para Ecuador';
    }

    // Extraer componentes
    final provincia = int.parse(value.substring(0, 2));
    final canton = int.parse(value.substring(2, 4));
    final parroquia = int.parse(value.substring(4, 6));

    // Validar que no sean códigos 00
    if (canton == 0 || parroquia == 0) {
      return 'Los códigos de cantón y parroquia no pueden ser 00';
    }

    // Validar provincia (Ecuador tiene 24 provincias)
    if (provincia < 1 || provincia > 24) {
      return 'El código de provincia no es válido';
    }

    // Validaciones adicionales más específicas
    if (canton > 50) {
      // Máximo realista de cantones por provincia
      return 'El código de cantón no es válido';
    }

    if (parroquia > 99) {
      // Máximo realista de parroquias por cantón
      return 'El código de parroquia no es válido';
    }

    return null; // Código postal válido
  }

  // Validar todos los campos antes del registro
  bool validarTodosLosCampos(String username, String password, String nombre,
      String apellido, String ciudad, String provincia, String email,
      String telefono, String codigoPostal) {
    
    // Verificar que todas las validaciones pasen
    if (validarUsuario(username) != null) return false;
    if (validarPassword(password) != null) return false;
    if (validarNombre(nombre) != null) return false;
    if (validarApellido(apellido) != null) return false;
    if (validarCiudad(ciudad) != null) return false;
    if (validarProvincia(provincia) != null) return false;
    if (validarEmail(email) != null) return false;
    if (validarTelefono(telefono) != null) return false;
    if (validarCodigoPostal(codigoPostal) != null) return false;
    
    return true; // Todos los campos son válidos
  }

  // Mostrar mensaje de error o éxito
  void mostrarMensaje(BuildContext context, String mensaje, bool esError) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
        backgroundColor: esError ? Colors.red : Colors.green,
        duration: Duration(seconds: 3),
      ),
    );
  }

  // Simulación de guardado en base de datos
  Future<bool> guardarUsuarioEnBD(UsuarioModel usuario) async {
    try {
      // Simular delay de la API
      await Future.delayed(Duration(seconds: 2));
      
      // Aquí iría la lógica real para guardar en tu base de datos
      // Por ejemplo: llamada a API REST, Firebase, SQLite, etc.
      print('Usuario guardado: ${usuario.toJson()}');
      
      // Simular éxito (cambiar por tu lógica real)
      return true;
      
    } catch (e) {
      print('Error al guardar usuario: $e');
      return false;
    }
  }

  // Verificar si el usuario ya existe
  Future<bool> usuarioYaExiste(String username, String email) async {
    try {
      // Simular delay de verificación
      await Future.delayed(Duration(milliseconds: 500));
      
      // Aquí iría la verificación real en tu base de datos
      // Por ejemplo: consulta a API o base de datos local
      
      // Lista simulada de usuarios existentes (cambiar por tu lógica real)
      List<String> usuariosExistentes = ['admin', 'test', 'usuario1'];
      List<String> emailsExistentes = ['test@test.com', 'admin@admin.com'];
      
      return usuariosExistentes.contains(username.toLowerCase()) ||
             emailsExistentes.contains(email.toLowerCase());
             
    } catch (e) {
      print('Error al verificar usuario: $e');
      return false;
    }
  }

  //Registrar usuario
  void registrarUsuario(BuildContext context, String username,
      String password, String nombre, String apellido, String ciudad,
      String provincia, String email, String telefono, String codigoPostal) async {
    
    try {
      // 1. Validar todos los campos
      if (!validarTodosLosCampos(username, password, nombre, apellido, 
          ciudad, provincia, email, telefono, codigoPostal)) {
        mostrarMensaje(context, 'Por favor complete todos los campos correctamente', true);
        return;
      }

      // 2. Mostrar indicador de carga
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 20),
                Text('Registrando usuario...'),
              ],
            ),
          );
        },
      );

      // 3. Verificar si el usuario ya existe
      bool existe = await usuarioYaExiste(username, email);
      if (existe) {
        Navigator.of(context).pop(); // Cerrar indicador de carga
        mostrarMensaje(context, 'El usuario o email ya están registrados', true);
        return;
      }

      // 4. Crear objeto usuario
      UsuarioModel nuevoUsuario = UsuarioModel(
        username: username.trim(),
        password: password, // En producción, hashear la contraseña
        nombre: nombre.trim(),
        apellido: apellido.trim(),
        ciudad: ciudad.trim(),
        provincia: provincia.trim(),
        email: email.trim().toLowerCase(),
        telefono: telefono.trim(),
        codigoPostal: codigoPostal.trim(),
      );

      // 5. Guardar usuario en la base de datos
      bool guardado = await guardarUsuarioEnBD(nuevoUsuario);
      
      Navigator.of(context).pop(); // Cerrar indicador de carga

      // 6. Mostrar resultado
      if (guardado) {
        mostrarMensaje(context, 'Usuario registrado exitosamente', false);
        
        // Opcional: navegar a otra pantalla después del registro exitoso
        // Navigator.pushReplacementNamed(context, '/login');
        
      } else {
        mostrarMensaje(context, 'Error al registrar el usuario. Intente nuevamente', true);
      }

    } catch (e) {
      // Cerrar indicador de carga si está abierto
      if (Navigator.canPop(context)) {
        Navigator.of(context).pop();
      }
      
      print('Error en registrarUsuario: $e');
      mostrarMensaje(context, 'Error inesperado. Intente nuevamente', true);
    }
  }
}