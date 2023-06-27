import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/text_form_field_login.dart';



class LoginPage extends StatelessWidget {

  static const String name = 'Login';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black.withOpacity(0.1),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[

            const Spacer(),
            
            const Icon(Icons.person_pin, size: 100, color: Color(0xff727273)),
            
            const SizedBox(height: 10),
            
            const TextFormFieldLogin(),
            
            const SizedBox(height: 10),
          
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Switch(
                  value: false, //ligth, 
                  activeColor: const Color(0xff3F6691),
                  onChanged: (value){}
                ),
                const SizedBox(width: 150),
            
                const Text(
                  'Recordarme?',
                  style: TextStyle(
                    letterSpacing: 3,
                    fontSize: 16
                  ),
                ),
              ]
            ),

            const Spacer(),
              
            _CustomSingUp(),
            
          ]
        )
      ),
    );
  }
}

class _CustomSingUp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
        ),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            const Text(
              '¿No tienes cuenta?',
              style: TextStyle(
                fontSize: 16
              ),
            ),
        
            const Spacer(),
        
            TextButton(
              onPressed: (){
                context.push('/pages/registro_page.dart');
              }, 
              child: const Text(
               'Registrarse',
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