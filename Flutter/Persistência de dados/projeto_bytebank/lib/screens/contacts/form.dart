import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_bytebank/components/editor.dart';
import 'package:projeto_bytebank/components/variables.dart';
import 'package:projeto_bytebank/models/contact.dart';

class ContactsForm extends StatefulWidget {
  @override
  _ContactsFormState createState() => _ContactsFormState();
}

class _ContactsFormState extends State<ContactsForm> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _controllerName = TextEditingController();
    final TextEditingController _controllerAccountNumber =
        TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('New contact'),
      ),
      body: Column(
        children: [
          Editor(
            controller: _controllerName,
            label: contacts_name,
          ),
          Editor(
            controller: _controllerAccountNumber,
            label: contacts_accountNumer,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {
                  final String name = _controllerName.text;
                  final int accountNumber =
                      int.tryParse(_controllerAccountNumber.text);
                  final Contact newContact = new Contact(0, name, accountNumber);
                  Navigator.pop(context, newContact);
                },
                child: Text(button_create),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
