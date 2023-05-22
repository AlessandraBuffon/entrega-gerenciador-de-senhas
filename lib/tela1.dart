import 'package:flutter/material.dart';

class tela1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 135, 0, 0),
            title: const Text('Tela1')),
        body: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 159, 85, 11)),
            child: Text('Voltar'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Minha conta"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Senhas"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Cartoes"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Favoritos"),
        ]),
      ),
    );
  }
}
