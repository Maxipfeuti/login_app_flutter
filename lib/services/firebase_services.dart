import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';


FirebaseFirestore db = FirebaseFirestore.instance;

Future<void> addName ( User user ) {
  CollectionReference users = db.collection('users');

  return users.add({
    'nombre':              user.nombre,
    'fecha de nacimiento': user.fecha,
    'email':               user.email,
    'contraseña':          user.password
  });

}



