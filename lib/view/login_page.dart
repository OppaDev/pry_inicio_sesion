import 'package:flutter/material.dart';
import 'package:pry_inicio_sesion/themes/text_styles.dart';
import '../controller/login_controller.dart';
import '../themes/button_styles.dart';
import '../themes/color_schemes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //definir el estado del formulario
  //validar el formulario
  final _formKey = GlobalKey<FormState>();
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  //instanciar la calse controller
  final loginController = LoginController();
  //variable para manejar el estado del ckeckbox
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login',style: TextStyle(color:Colors.white),),
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.cyan,Colors.purpleAccent
            ],
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
                  Icon(Icons.person, size: 100,color: Colors.white,),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: userController,
                    style: AppTextStyles.input,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person,color: Colors.white,),
                      hintText: 'Username',
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    validator: loginController.validarUsuario,
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: passwordController,
                    style: AppTextStyles.input,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock,color: Colors.white,),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    validator: loginController.validarPassword,
                    obscureText: true,
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: rememberMe,
                            onChanged: (value) {
                              setState(() {
                                rememberMe = value!;
                              });
                            },
                          ),
                          Text('Remember Me',style: AppTextStyles.input,),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('Forgot Password?',style: AppTextStyles.input,),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        //llamar al metodo de la clase controller
                        loginController.iniciarSesion(
                          context,
                          userController.text,
                          passwordController.text,
                        );
                      }
                    },
                    child: Text('Login',style: AppTextStyles.button,),
                    style: AppButtonStyles.primary,
                  ),
                  SizedBox(height: 20,),
                  Text('Not a member?',style: AppTextStyles.input,),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/registro');
                    },
                    child: Text('Register',style: AppTextStyles.button,),
                    style: AppButtonStyles.outline,
                  ),
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}
