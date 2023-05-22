// ignore: file_names
import 'package:enterga_telas/SenhaSQLiteDataSource.dart';
import 'package:flutter/material.dart';
import 'Data/senha_entity.dart';
import 'cadsenhas.dart';


// ignore: camel_case_types
class listaSenhas extends StatelessWidget {
  const listaSenhas({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lista de senhas",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController textEditingController;

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de senhas"),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              senhaSQLiteDatasource().getAllSenha();
              setState(() {});
            },
            child: const Text(
              "Excluir todos",
              style: TextStyle(color: Colors.yellow),
            ),
          )
        ],
      ),
      body: FutureBuilder<List<SenhaEntity>>(
        future: senhaSQLiteDatasource().getAllSenha(),
        builder:
            (BuildContext context, AsyncSnapshot<List<SenhaEntity>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                SenhaEntity item = snapshot.data![index];
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(color: Colors.red),
                  onDismissed: (direction) {
                    senhaSQLiteDatasource().deletarSenhas(item.senhaID! as SenhaEntity);
                  },
                  child: ListTile(
                    title: Text(item.descricao!),
                    subtitle: Text(item.login!),
                    leading: CircleAvatar(child: Text(item.senhaID.toString())),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const cadsenhas()));
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const cadsenhas()));
        },
      ),
    );
  }
}
