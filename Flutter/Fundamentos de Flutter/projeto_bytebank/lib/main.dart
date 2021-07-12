import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Transferências'),
        ),
        body: TransferList(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
        ),
      ),
    ));

class TransferList  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransferItem(Transfer(111, 110.00)),
        TransferItem(Transfer(222, 200)),
        TransferItem(Transfer(333, 450)),
      ],
    );
  }
}

class TransferItem  extends StatelessWidget{
  Transfer _transfer;
  TransferItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transfer.accountNumber.toString()),
        subtitle: Text(_transfer.value.toString()),
      ),
    );
  }
}

class Transfer {
  final int accountNumber;
  final double value;

  Transfer(this.accountNumber, this.value);
}
