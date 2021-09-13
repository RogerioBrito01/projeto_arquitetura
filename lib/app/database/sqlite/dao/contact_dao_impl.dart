import 'package:agenda/app/database/sqlite/conection.dart';
import 'package:agenda/app/domain/entities/contact.dart';
import 'package:agenda/app/domain/interfaces/contact_dao.dart';
import 'package:sqflite/sqflite.dart';
//esta classe de contactDaoImpl e responsavel pela imprementaçao dos metodos  do crud sa(salva,remover, editar e lista)
// ela emprementa os dados
//da classe interface/contact_dao.dart

class ContactDAOImpl implements ContactDAO {
  Database _db;

  @override
  //metodo de lista onde ele converte em uma lista de contato.
  Future<List<Contact>> find() async {
    _db = await Connection.get();
    List<Map<String, dynamic>> resultado = await _db.query('contact');
    List<Contact> lista = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return Contact(
          id: linha['id'],
          nome: linha['nome'],
          telefone: linha['telefone'],
          email: linha['email'],
          urlAvatar: linha['url_avatar']);
    });

    return lista;
  }

  @override
  //Metódo de remover os dados
  remove(int id) async {
    _db = await Connection.get();
    var sql = 'DELETE FROM contact WHERE id = ?';
    _db.rawDelete(sql, [id]);
  }

  @override
  //metódo de salvar os dados  ele e um metodo que passa como parameto um contact e um metoso async
  //por que espera dados futuros
  save(Contact contact) async {
    _db = await Connection.get();
    var sql;
    if (contact.id == null) {
      sql =
          'INSERT INTO contact (nome, telefone,email,url_avatar) VALUES (?,?,?,?)';
      _db.rawInsert(sql,
          [contact.nome, contact.telefone, contact.email, contact.urlAvatar]);
    } else {
      sql =
          'UPDATE contact SET nome = ?, telefone =?, email = ?, url_avatar= ? WHERE id = ?';
      _db.rawUpdate(sql, [
        contact.nome,
        contact.telefone,
        contact.email,
        contact.urlAvatar,
        contact.id
      ]);
    }
  }
}
