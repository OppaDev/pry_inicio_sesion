import 'package:flutter/material.dart';
import '../themes/text_styles.dart';
import '../controller/register_controller.dart';
import '../themes/button_styles.dart';
import '../themes/color_schemes.dart';

class RegistroPage extends StatefulWidget {
  @override
  State<RegistroPage> createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  //definir el estado del formulario
  //validar el formulario
  final _formKey = GlobalKey<FormState>();
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  final nombreController = TextEditingController();
  final apellidoController = TextEditingController();
  final ciudadController = TextEditingController();
  final provinciaController = TextEditingController();
  final emailController = TextEditingController();
  final telefonoController = TextEditingController();
  final codigoPostalController = TextEditingController();
  //instanciar la calse controller
  final registerController = RegisterController();
  //variable para manejar el estado del ckeckbox
  bool terminosCondiciones = false;
  //diseñar formulario
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Registro',
          style: TextStyle(color: Colors.purpleAccent),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.cyan, Colors.purpleAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20),
        //contenedor principal
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Icon(Icons.person_add, size: 100, color: Colors.white),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: userController,
                    style: AppTextStyles.input,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person, color: Colors.white),
                      hintText: 'Username',
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    validator: registerController.validarUsuario,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    style: AppTextStyles.input,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: Colors.white),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    validator: registerController.validarPassword,
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: nombreController,
                    style: AppTextStyles.input,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.badge, color: Colors.white),
                      hintText: 'Nombre',
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    validator: registerController.validarNombre,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: apellidoController,
                    style: AppTextStyles.input,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.badge_outlined,
                        color: Colors.white,
                      ),
                      hintText: 'Apellido',
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    validator: registerController.validarApellido,
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dirección',
                          style: AppTextStyles.input.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: ciudadController,
                          style: AppTextStyles.input,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.location_city,
                              color: Colors.white,
                            ),
                            hintText: 'Ciudad',
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          validator: registerController.validarCiudad,
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: provinciaController,
                          style: AppTextStyles.input,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.map, color: Colors.white),
                            hintText: 'Provincia',
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          validator: registerController.validarProvincia,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: emailController,
                    style: AppTextStyles.input,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email, color: Colors.white),
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    validator: registerController.validarEmail,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: telefonoController,
                    style: AppTextStyles.input,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone, color: Colors.white),
                      hintText: 'Teléfono',
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    validator: registerController.validarTelefono,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: codigoPostalController,
                    style: AppTextStyles.input,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.local_post_office,
                        color: Colors.white,
                      ),
                      hintText: 'Código Postal',
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    validator: registerController.validarCodigoPostal,
                  ),
                  SizedBox(height: 20),
                  // Añadimos una fila para aceptar términos y condiciones
                  Row(
                    children: [
                      Checkbox(
                        value: terminosCondiciones,
                        onChanged: (value) {
                          setState(() {
                            terminosCondiciones = value!;
                          });
                        },
                      ),
                      Expanded(
                        child: Text(
                          'Acepto los términos y condiciones',
                          style: AppTextStyles.input,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate() &&
                          terminosCondiciones) {
                        // Llamar al método de la clase controller
                        registerController.registrarUsuario(
                          context,
                          userController.text,
                          passwordController.text,
                          nombreController.text,
                          apellidoController.text,
                          ciudadController.text,
                          provinciaController.text,
                          emailController.text,
                          telefonoController.text,
                          codigoPostalController.text,
                        );

                        // Limpiar el formulario
                        userController.clear();
                        passwordController.clear();
                        nombreController.clear();
                        apellidoController.clear();
                        ciudadController.clear();
                        provinciaController.clear();
                        emailController.clear();
                        telefonoController.clear();
                        codigoPostalController.clear();

                        setState(() {
                          terminosCondiciones = false;
                        });
                      } else if (!terminosCondiciones) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Debe aceptar los términos y condiciones',
                            ),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                    child: Text('Registrar', style: AppTextStyles.button),
                    style: AppButtonStyles.primary,
                  ),
                  SizedBox(height: 20),
                  Text('¿Ya tienes una cuenta?', style: AppTextStyles.input),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    child: Text('Iniciar Sesión', style: AppTextStyles.button),
                    style: AppButtonStyles.outline,
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
