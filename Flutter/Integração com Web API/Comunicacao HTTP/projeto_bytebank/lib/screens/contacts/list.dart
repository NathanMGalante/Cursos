import 'package:flutter/material.dart';
import 'package:projeto_bytebank/components/progress.dart';
import 'package:projeto_bytebank/database/dao/contact_dao.dart';
import 'package:projeto_bytebank/models/contact.dart';
import 'package:projeto_bytebank/screens/contacts/form.dart';
import 'package:projeto_bytebank/screens/transactions/form.dart';

class ContactsList extends StatefulWidget {
  @override
  _ContactsListState createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Transfers'),
        ),
        body: FutureBuilder<List<Contact>>(
          initialData: [],
          future: _dao.findAll(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return Progress(
                  message: 'Carregando...',
                );
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
                    return _ContactItem(
                      contact,
                      onClick: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TransactionForm(contact)));
                      },
                    );
                  },
                  itemCount: contacts.length,
                );
                break;
            }
            return Text('Unknown error');
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(
                  MaterialPageRoute(
                    builder: (context) => ContactsForm(),
                  ),
                )
                .then((value) => setState(() {}));
          },
          child: Icon(Icons.add),
        ),
      );
}

class _ContactItem extends StatelessWidget {
  final Contact contact;
  final Function onClick;

  _ContactItem(this.contact, {@required this.onClick});

  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          onTap: () => onClick(),
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
