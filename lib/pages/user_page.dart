import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class UserPage extends StatelessWidget {

  static const String name = 'UserPage';

  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {

    Future<List> getDatos() async {

      List usuarioActual = [];

      CollectionReference users = FirebaseFirestore.instance.collection('users');

      QuerySnapshot snapshot = await users.get();

      for (var documento in snapshot.docs) { 
        usuarioActual.add(documento.data());
      }

      return usuarioActual;
    }


    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Datos del Usuario'),
      ),
      body: Center(
        child: FutureBuilder(
          future: getDatos(),
          builder: (context, snapshot) {
            if ( snapshot.hasData ) {

              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    // ignore: prefer_interpolation_to_compose_strings
                    child: Center(child: Text('Usuario ingresado: ' + snapshot.data?[index]['email'])),
                  );
                },
              );

            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}