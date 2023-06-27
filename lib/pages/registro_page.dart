import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


import '../widgets/text_form_field_registro.dart';




class RegistroPage extends StatelessWidget {

  static const String name = 'Registro';

  const RegistroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black.withOpacity(0.1),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: double.infinity,
        height: double.infinity,
        child: Column(
        
          children:[

            const Spacer(),
          
            const Icon(Icons.person_pin, size: 100, color: Color(0xff727273)),
           
            const Text(
              'Nuevo Usuario',
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold
              ),
            ),
      
            const TextFormFieldRegistro(),

            const Spacer(),
      
            _CustomSingIn( ),
        
          ]
        )
      ),
    );
  }
}


class _CustomSingIn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
        ),
        height: 35,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              'Ya se encuentra registrado?',
              style: TextStyle(
                fontSize: 16
              ),
            ),

            const Spacer(),
        
            TextButton(
              onPressed: (){
                context.pop();
              }, 
              child: const Text(
               'Ingresar',
                style: TextStyle(
                  fontSize: 16
                ),
              ) 
            )
          ],
        ),
      ),
    );
  }
}

