

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ultimo_login_app/models/user_model.dart';
import 'package:ultimo_login_app/services/firebase_services.dart';

import '../bloc/validation/validation_cubit.dart';


class TextFormFieldRegistro extends StatefulWidget {


  const TextFormFieldRegistro({super.key});

  @override
  State<TextFormFieldRegistro> createState() => _TextFormFieldRegistroState();
}

class _TextFormFieldRegistroState extends State<TextFormFieldRegistro> {



  TextEditingController name = TextEditingController();
  TextEditingController fecha = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password= TextEditingController();

  @override
  void initState() {
    super.initState();
    name.text = '';
    fecha.text = '';
    email.text = '';
    password.text = '';
  }
  
  @override
  void dispose() {
    name.dispose();
    fecha.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final validation = context.watch<ValidationCubit>();
    final nombre = validation.state.nombre;
    final mail = validation.state.email;
    final pass = validation.state.password;

    const TextStyle style = TextStyle( fontFamily: 'Montserrat', fontWeight: FontWeight.w900 );



    return Form(
      child: SingleChildScrollView(
        child: Column(
          
          children:[ 
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                onChanged: validation.nombreChanged,
                controller: name,
                decoration: InputDecoration(
                  label: const Text(
                    'Nombre',
                    style: style,
                  ),
                  errorText: nombre.errorMessage
                ),
              ),
            ),
          
            const SizedBox(height: 5),
          
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: fecha,
                keyboardType: TextInputType.datetime,
                decoration:const InputDecoration(
                  label: Text('Fecha nacimiento', style: style),
                ),
              ),
            ),
          
            const SizedBox(height: 5),
          
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                onChanged: validation.emailChanged,
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  label: const Text('Email', style: style),
                  errorText: mail.errorMessage
                ),
              ),
            ),
          
            const SizedBox(height: 5),
          
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                onChanged: validation.passwordChanged,
                controller: password,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  label: const Text('Contraseña', style: style),
                  errorText: pass.errorMessage
                ),
              ),
            ),
      
            const SizedBox(height: 10),
      
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xff3F6691),
                shape: const ContinuousRectangleBorder() 
              ),  
              onPressed: ()async{
                final User usuario = User(
                  nombre: name.text,
                  fecha: fecha.text,
                  email: email.text,
                  password: password.text
                );
                await addName(usuario);
                // ignore: use_build_context_synchronously
                context.pop();
              },
                
              child: const Text(
               'Registrarse',
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
      ),
    );
  }
}
