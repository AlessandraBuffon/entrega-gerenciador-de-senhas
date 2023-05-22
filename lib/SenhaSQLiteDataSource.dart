
import 'package:enterga_telas/conectar.dart';
import 'package:enterga_telas/Data/senha_entity.dart';
import 'package:path/path.dart';

import 'package:enterga_telas/Data/data_contantes.dart';

class senhaSQLiteDatasource {
  Future inserirSenha(descricao, login, senha) async {
    final db = await Conectar.getConexaoDB();
    senha.senhaID = await db.rawInsert('''insert into $SENHA_TABLE_NAME(
              $SENHA_COLUMN_DESCRICAO,
              $SENHA_COLUMN_LOGIN,
              $SENHA_COLUMN_SENHA)
              values(
                '${descricao}','${login}','${senha}') 
              ''');
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    final db = await Conectar.getConexaoDB();
    return await db.query(SENHA_TABLE_NAME);
  }

  Future<List<SenhaEntity>> getAllSenha() async {
    final db = await Conectar.getConexaoDB();
    List<Map> dbResult = await db.rawQuery('SELECT * from $SENHA_TABLE_NAME');

    List<SenhaEntity> senhas = [];
    for (var row in dbResult) {
      SenhaEntity senha = SenhaEntity();
      senha.senhaID = row['senhaID'];
      senha.descricao = row['descricao'];
      senha.login = row['login'];
      senha.senha = row['senha'];
      senhas.add(senha);
    }
    return senhas;
  }

    Future<SenhaEntity> getSenhaId(senhaID) async {
    final db = await Conectar.getConexaoDB();
    var dbResult = await db.rawQuery('SELECT senhaID from $SENHA_TABLE_NAME where $SENHA_COLUMN_ID = $senhaID');
      SenhaEntity senha = SenhaEntity();
      var dbItem = dbResult.first;
      senha.senhaID = dbItem['senhaID'] as int?;
      senha.descricao = dbItem['descricao'] as String?;
      senha.login = dbItem['login'] as String?;
      senha.senha = dbItem['senha'] as String?;
      return senha;
    }  

  Future<void> atualizarSenha(SenhaEntity senha) async {
    final db = await Conectar.getConexaoDB();
    await db.transaction((txn) async {
      await txn.rawUpdate(
          'update $SENHA_TABLE_NAME set $SENHA_COLUMN_DESCRICAO = ?, $SENHA_COLUMN_LOGIN = ?, $SENHA_COLUMN_SENHA = ? where id = ?',
          [senha.descricao, senha.login, senha.senha]);
    });
  }

  Future<void> deletarSenhaID(senhaId) async {
    final db = await Conectar.getConexaoDB();
    await db.transaction((txn) async {
      await txn
          .rawUpdate('delete from $SENHA_TABLE_NAME where id = ?', [senhaId]);
    });
  }

  Future<void> deletarSenhas(SenhaEntity senhaEntity) async {
    final db = await Conectar.getConexaoDB();
    await db.transaction((txn) async {
      await txn
          .rawUpdate('delete from $SENHA_TABLE_NAME ');
    });
  }

  Future<List<SenhaEntity>> pesquisarSenha(String filtro) async {
    List<SenhaEntity> senhas = [];
    final db = await Conectar.getConexaoDB();
    List<Map> dbResult = await db.rawQuery(
        'SELECT * from $SENHA_TABLE_NAME where $SENHA_COLUMN_DESCRICAO like ?',
        ['%$filtro%']);
    for (var row in dbResult) {
      SenhaEntity senha = SenhaEntity();
      senha.senhaID = row['senhaID'];
      senha.descricao = row['descricao'];
      senha.login = row['login'];
      senha.senha = row['senha'];
      senhas.add(senha);
    }
    return senhas;
  }

  Future<bool> getSenhaEmail(String filtro) async {
    final db = await Conectar.getConexaoDB();
    List<Map> dbResult = await db.rawQuery(
        'SELECT * from $SENHA_TABLE_NAME where $SENHA_COLUMN_LOGIN = ?',
        ['$filtro']);

    if (dbResult.isEmpty)
      return false;
    else
      return true;
  }
}
