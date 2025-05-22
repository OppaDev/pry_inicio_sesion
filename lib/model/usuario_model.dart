class UsuarioModel {
  final String username;
  final String password;
  final String nombre;
  final String apellido;
  final String ciudad;
  final String provincia;
  final String email;
  final String telefono;
  final String codigoPostal;

  UsuarioModel({
    required this.username,
    required this.password,
    required this.nombre,
    required this.apellido,
    required this.ciudad,
    required this.provincia,
    required this.email,
    required this.telefono,
    required this.codigoPostal,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'nombre': nombre,
      'apellido': apellido,
      'ciudad': ciudad,
      'provincia': provincia,
      'email': email,
      'telefono': telefono,
      'codigoPostal': codigoPostal,
    };
  }
}