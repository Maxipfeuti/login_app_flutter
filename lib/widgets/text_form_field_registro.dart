import 'package:flutter/material.dart';
import 'package:ultimo_login_app/models/user_model.dart';
import 'package:ultimo_login_app/services/firebase_services.dart';

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
  Widget build(BuildContext context) {

    const TextStyle style = TextStyle( fontFamily: 'Montserrat', fontWeight: FontWeight.w900 );


    return Form(
      child: Column(
        
        children:[ 
      
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: name,
              decoration:const InputDecoration(
                label: Text(
                  'Nombre',
                  style: style,
                ),
              ),
            ),
          ),
    
          const SizedBox(height: 10),
    
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
    
          const SizedBox(height: 10),
    
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              decoration:const InputDecoration(
                label: Text('Email', style: style),
              ),
            ),
          ),
    
          const SizedBox(height: 10),
    
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: password,
              keyboardType: TextInputType.visiblePassword,
              decoration:const InputDecoration(
                label: Text('Contraseña', style: style),
              ),
            ),
          ),

          const SizedBox(height: 20),

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
    );
  }
}
