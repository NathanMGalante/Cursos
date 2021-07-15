import 'package:flutter/material.dart';
import 'package:projeto_bytebank/components/editor.dart';
import 'package:projeto_bytebank/database/app_database.dart';
import 'package:projeto_bytebank/models/contact.dart';
import 'package:projeto_bytebank/screens/contacts/form.dart';

class ContactsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Contacts'),
        ),
        body: FutureBuilder<List<Contact>>(
          initialData: [],
          future: findAll(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return Loading();
                break;
              case ConnectionState.active:
                // retorna pedaços, como exemplo um download,
                // onde retornaria o progresso...
                break;
              case ConnectionState.done:
                final List<Contact> contacts = snapshot.data;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final Contact contact = contacts[index];
                    return _ContactItem(contact);
                  },
                  itemCount: contacts.length,
                );
                break;
            }
            return Text('Unknown error');
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ContactsForm()))
              .then(
                (newContact) => debugPrint(newContact.toString()),
              ),
          child: Icon(Icons.add),
        ),
      );
}

class _ContactItem extends StatelessWidget {
  final Contact contact;

  _ContactItem(this.contact);

  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          title: Text(
            contact.name,
            style: TextStyle(fontSize: 24.0),
          ),
          subtitle: Text(
            contact.accountNumber.toString(),
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      );
}
