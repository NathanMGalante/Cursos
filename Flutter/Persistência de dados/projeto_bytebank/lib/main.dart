import 'package:flutter/material.dart';
import 'package:projeto_bytebank/screens/transfers/list.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Dashboard(),
        theme: ThemeData(
          primaryColor: Colors.teal[800],
          accentColor: Colors.tealAccent[700],
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: TextButton.styleFrom(
            primary: Colors.black,
            backgroundColor: Colors.tealAccent[700],
          )),
        ),
      );
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Column(
        children: [
          Image.asset('images/bytebank_logo.png'),
          Container(
            width: 100,
            height: 100,
            color: Colors.teal[800],
            child: Column(
              children: [
                Icon(Icons.people),
                Text('Contacts'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
