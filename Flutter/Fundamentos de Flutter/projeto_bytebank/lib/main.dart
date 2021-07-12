import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TransferForm(),
      ),
    );
  }
}

class TransferForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Transferência'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                labelText: 'Número da conta',
                hintText: '0000',
              ),
              keyboardType: TextInputType.number,
            ),
          ),Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: 'Valor',
                hintText: '0,00',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(
            child: Text('Confirmar'),
          ),
        ],
      ),
    );
  }
}

class TransferList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: Column(
        children: [
          TransferItem(Transfer(111, 110.00)),
          TransferItem(Transfer(222, 200)),
          TransferItem(Transfer(333, 450)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }
}

class TransferItem extends StatelessWidget {
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
