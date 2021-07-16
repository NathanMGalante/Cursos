import 'package:flutter/material.dart';
import 'package:projeto_bytebank/http/web_client.dart';
import 'package:projeto_bytebank/screens/dashboard.dart';

void main() {
  runApp(ByteBankApp());
  findAll().then((transactions) => print('new transactions: $transactions'));
}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Dashboard(),
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
