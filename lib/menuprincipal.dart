
import 'package:flutter/material.dart';

import 'cadcartoes.dart';
import 'geradorsenha.dart';
import 'listaSenhas.dart';


// ignore: camel_case_types
class menuprincipal extends StatelessWidget {
  const menuprincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          drawer: Drawer(
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text("Minha conta"),
                  accountEmail: Text("alessandra@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(
                        'https://gamepedia.cursecdn.com/minecraft_br_gamepedia/7/73/Fox.png'),
                  ),
                ),
                ListTile(
                    leading: Icon(Icons.star),
                    title: Text("Favoritos"),
                    subtitle: Text("Meus favoritos"),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      debugPrint('toquei no drawer');
                    }),
                ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text("Perfil"),
                    subtitle: Text("Perfil do usuário"),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.pop(context);
                    }),
                ListTile(
                    leading: Icon(Icons.credit_card),
                    title: Text("Cartões"),
                    subtitle: Text("Cartões do usuário"),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return cadcartoes();
                      }));
                    }),
                ListTile(
                    leading: Icon(Icons.password_rounded),
                    title: Text("Gerador de Senhas"),
                    subtitle: Text("Gerador de Senhas"),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return geradorSenha();
                      }));
                    }),
                     ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text("senhas salvas"),
                    subtitle: Text("suas senhas"),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return listaSenhas();
                      }));
                      
                    }),
              ],
            ),
          ),
          appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 5, 101, 105),
              title: const Text('Menu Principal')),
          body: Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
              child: Text('Voltar'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Minha conta",
                  backgroundColor: Color.fromARGB(255, 31, 141, 232)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.password),
                  label: "Senhas",
                  backgroundColor: Color.fromARGB(255, 11, 74, 150)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.credit_card),
                  label: "Cartões",
                  backgroundColor: Color.fromARGB(255, 10, 138, 155)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: "Favoritos",
                  backgroundColor: Color.fromARGB(255, 21, 180, 212)),
            ],
          )),
    );
  }
}
