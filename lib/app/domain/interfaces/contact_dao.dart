import 'package:agenda/app/domain/entities/contact.dart';
//Está classe e uma classe de interfece porisso e abstract ela defini os metodos que vão ser emprementados
//tornado assim obrigatório sua criação na classe  ContactDaoImpl

abstract class ContactDAO {
  //salva
  save(Contact contact);
//remove
  remove(int id);
//lista
  Future<List<Contact>> find();
}
