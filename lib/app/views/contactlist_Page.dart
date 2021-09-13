import 'package:agenda/app/domain/entities/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'contact_list_back.dart';

class ContactList extends StatelessWidget {
  //const ContactList({Key key}) : super(key: key);
  //criando o metódo para busca os dados
  final _back = ContactListBack();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Contatos'),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  _back.goToForm(context);
                })
          ],
        ),
        body: Observer(builder: (context) {
          return FutureBuilder(
              future: _back.list,
              builder: (context, futuro) {
                if (!futuro.hasData) {
                  return CircularProgressIndicator();
                } else {
                  List<Contact> lista = futuro.data;
                  return ListView.builder(
                    itemCount: lista.length,
                    itemBuilder: (context, i) {
                      var contato = lista[i];
                      var avatar = CircleAvatar(
                        backgroundImage: NetworkImage(contato.urlAvatar),
                      );
                      return ListTile(
                        leading: avatar,
                        subtitle: Text(contato.telefone),
                        trailing: Container(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                  icon: Icon(Icons.edit), onPressed: null),
                              IconButton(
                                  icon: Icon(Icons.delete), onPressed: null),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              });
        }));
  }
}
