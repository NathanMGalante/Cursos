import 'package:flutter/material.dart';
import 'package:projeto_bytebank/screens/dashboard.dart';

void main() {
  runApp(ByteBankApp());
  //save(Contact(0, 'Nathan', 12345678)).then((id) {
  //   findAll().then((contacts) {
  //     debugPrint(contacts.toString());
  //   });
  //});
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
