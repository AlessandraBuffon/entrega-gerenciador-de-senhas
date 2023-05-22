import 'package:enterga_telas/recuperarsenha.dart';
import 'package:flutter/material.dart';

import 'CadastroUsuario.dart';
import 'menuprincipal.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Login')),
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 128, 208, 199),
                Color.fromARGB(255, 54, 118, 202),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: _Login(),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class _Login extends StatelessWidget {
  String email = '';
  String pass = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'TELA DE LOGIN APP',
              style: TextStyle(
                  color: Color.fromARGB(255, 2, 29, 51),
                  fontWeight: FontWeight.w500,
                  fontSize: 30),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Digite os dados',
              style: TextStyle(
                  fontSize: 20, color: Color.fromARGB(255, 9, 69, 52)),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'e-mail',
                labelStyle: TextStyle(color: Color.fromARGB(255, 4, 11, 18)),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Senha',
                labelStyle: TextStyle(color: Color.fromARGB(255, 4, 11, 18)),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return recuperarsenha();
              }));
            },
            child: const Text(
              'Esqueci a senha',
              style: TextStyle(
                  color: Color.fromARGB(255, 5, 24, 40), fontSize: 20),
            ),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: ElevatedButton(
              child: const Text('Login'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return menuprincipal();
                }));
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 9, 74, 127),
              ),
            ),
          ),
         Row(
  children: <Widget>[
    const Text('Não possui conta?'),
    TextButton(
      child: const Text(
        'Cadastre aqui',
        style: TextStyle(
          fontSize: 20,
          color: Color.fromARGB(255, 243, 246, 249),
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return CadastroUsuario();
          }),
        );
      },
    ),
  ],
  mainAxisAlignment: MainAxisAlignment.center,
),
       
    ],
  ),
);
}
}