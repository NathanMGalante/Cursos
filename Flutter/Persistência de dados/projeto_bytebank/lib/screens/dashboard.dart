import 'package:flutter/material.dart';
import 'package:projeto_bytebank/components/editor.dart';
import 'package:projeto_bytebank/screens/contacts/list.dart';
import 'package:projeto_bytebank/screens/transfers/list.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Dashboard')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Logo(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardBox('Contacts', Icons.people),
                CardBox('Transfers', Icons.compare_arrows),
              ],
            )
          ],
        ),
      );
}

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset('images/bytebank_logo.png'),
    );
  }
}

class CardBox extends StatelessWidget {
  final String _text;
  final IconData _icon;

  CardBox(this._text, this._icon);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              switch (_text) {
                case 'Contacts':
                  return ContactsList();
                  break;
                case 'Transfers':
                  return TransferList();
                  break;
                default:
                  return Container(color: Colors.white, child: Loading());
              }
            }));
          },
          child: Container(
            width: 150,
            height: 100,
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  _icon,
                  color: Colors.white,
                  size: 32.0,
                ),
                Text(
                  _text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
