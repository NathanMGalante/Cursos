import 'package:flutter/material.dart';
import 'package:projeto_bytebank/screens/contacts/form.dart';

class ContactsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Contacts'),
        ),
        body: ListView(
          children: [
            Card(
              child: ListTile(
                title: Text(
                  'Nathan',
                  style: TextStyle(fontSize: 24.0),
                ),
                subtitle: Text(
                  '1000',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ],
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
