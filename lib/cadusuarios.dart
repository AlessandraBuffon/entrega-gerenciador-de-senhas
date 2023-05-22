import 'package:flutter/material.dart';

class cadusuarios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro de usuário'),
          actions: [IconButton(onPressed: null, icon: Icon(Icons.save))],
        ),
      ),
    );
  }
}

Widget fieldName() {
  return TextFormField(
    decoration:
        InputDecoration(border: OutlineInputBorder(), labelText: 'Nome'),
  );
}

Widget fieldEmail() {
  return TextFormField(
    keyboardType: TextInputType.emailAddress,
    decoration:
        InputDecoration(border: OutlineInputBorder(), labelText: 'E-mail'),
  );
}

Widget fieldSenha() {
  return TextFormField(
    obscureText: true,
    decoration:
        InputDecoration(border: OutlineInputBorder(), labelText: 'Senha'),
  );
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Form(
        child: Column(
          children: [
            fieldName(),
            fieldEmail(),
            fieldSenha(),
          ],
        ),
      ),
    );
  }
}
