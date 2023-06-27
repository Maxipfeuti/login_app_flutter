


class User {
  final String? nombre;
  final String? fecha;
  final String? email;
  final String? password;

  User({
    this.nombre = '', 
    this.fecha = '',
    this.email = '', 
    this.password = ''
  });

  factory User.fromJsonMap(Map<String, String> json) => User(
    nombre:    json['nombre'],
    fecha:     json['fecha'],
    email:     json['email'],
    password:  json['password'],
  );

  Map<String, dynamic> toJson() => {
    'nombre':   nombre,
    'fecha':    fecha,
    'email':    email,
    'password': password,
  };
}