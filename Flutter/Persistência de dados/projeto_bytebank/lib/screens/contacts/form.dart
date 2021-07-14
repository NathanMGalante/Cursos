import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_bytebank/components/editor.dart';
import 'package:projeto_bytebank/components/variables.dart';

class ContactsForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New contact'),
      ),
      body: Column(
        children: [
          Editor(label: contacts_name,),
          Editor(label: contacts_accountNumer,),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {  },
                child: Text(button_create),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
