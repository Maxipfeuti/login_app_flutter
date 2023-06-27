import 'package:flutter/material.dart';


class UserPage extends StatelessWidget {

  static const String name = 'UserPage';

  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Datos del Usuario'),
      ),
      body: const Center(
        child: Text('Hola Mundo'),
      ),
    );
  }
}