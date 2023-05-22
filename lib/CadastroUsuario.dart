import 'package:flutter/material.dart';

class CadastroUsuario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de Usuário')),
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
        child: _Cadastro(),
      ),
    );
  }
}

class _Cadastro extends StatelessWidget {
  String nome = '';
  String email = '';
  String senha = '';
  
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
              'TELA DE CADASTRO',
              style: TextStyle(
                color: Color.fromARGB(255, 2, 29, 51),
                fontWeight: FontWeight.w500,
                fontSize: 30),
            )),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              onChanged: (text) {
                nome = text;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nome',
                labelStyle: TextStyle(color: Color.fromARGB(255, 4, 11, 18)),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              onChanged: (text) {
                email = text;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'E-mail',
                labelStyle: TextStyle(color: Color.fromARGB(255, 4, 11, 18)),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              onChanged: (text) {
                senha = text;
              },
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Senha',
                labelStyle: TextStyle(color: Color.fromARGB(255, 4, 11, 18)),
              ),
            ),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: ElevatedButton(
              child: const Text('Cadastrar'),
              onPressed: () {
                // Implementar a lógica de cadastro aqui
                // Nome, e-mail e senha estão disponíveis nas variáveis nome, email e senha, respectivamente
                // É recomendável validar os dados antes de prosseguir com o cadastro
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 9, 74, 127),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
