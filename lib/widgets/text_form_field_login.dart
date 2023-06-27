
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ultimo_login_app/bloc/validation/validation_cubit.dart';

import '../models/user_model.dart';


class TextFormFieldLogin extends StatefulWidget {


  const TextFormFieldLogin({super.key});

  @override
  State<TextFormFieldLogin> createState() => _TextFormFieldLoginState();
}

class _TextFormFieldLoginState extends State<TextFormFieldLogin> {
  
  TextEditingController mail = TextEditingController();
  TextEditingController passwo = TextEditingController();
  late User usuario;
  List<User> usuarios = [];
  
  
  Future<List<User>> getUser() async {

    CollectionReference<Map<String, dynamic>> users = FirebaseFirestore.instance.collection('users');

    QuerySnapshot<Map<String, dynamic>> snapshot = await users.get();

    return snapshot.docs.map((doc) {
      var datos = doc.data();
      return User(
        email: datos['email'],
        password: datos['password'],
      );
    }).toList();
  }



  @override
  Widget build(BuildContext context) {
    final validation = context.watch<ValidationCubit>();
    final email = validation.state.email;
    final password = validation.state.password;


    return Form(
      child: Column(
        
        children:[ 
      
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              onChanged: validation.emailChanged,
              keyboardType: TextInputType.emailAddress,
              controller: mail,
              decoration: InputDecoration(
                label: const Text('Email'),
                errorText: email.errorMessage
              ),
            ),
          ),
          
          const SizedBox(height: 10),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              onChanged: validation.passwordChanged,
              controller: passwo,
              obscureText: true,
              decoration: InputDecoration(
                label: const Text('Contraseña'),
                errorText: password.errorMessage
              ),
            ),
          ),

          const SizedBox(height: 20),

          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xff3F6691),
              shape: const ContinuousRectangleBorder() 
            ),  
            onPressed:() async{ 
              usuarios = await getUser(); 
              if ( usuarios.isNotEmpty ) {
                // ignore: use_build_context_synchronously
                context.push('/pages/user_page.dart');
              } 
              
              //print('hola' + usuarios.length.toString());
            },
            child: const Text(
             'Ingresar',
              style: TextStyle(
                fontSize: 20,
                letterSpacing: 2,
                fontFamily: 'Roboto Slab',
                fontWeight: FontWeight.bold
              ),
            ) 
          )
        ],
      ),
    );
  }
}
