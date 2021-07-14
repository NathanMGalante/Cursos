import 'package:flutter/material.dart';
import 'package:projeto_bytebank/screens/contacts/form.dart';
import 'package:projeto_bytebank/screens/dashboard.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: ContactsForm(),
        theme: ThemeData(
          primaryColor: Colors.teal[900],
          accentColor: Colors.tealAccent[700],
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: TextButton.styleFrom(
            primary: Colors.black,
            backgroundColor: Colors.tealAccent[700],
          )),
        ),
      );
}
