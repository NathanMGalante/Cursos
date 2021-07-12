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
  final TextEditingController _controllerFieldNumberAccount = TextEditingController();
  final TextEditingController _controllerFieldValue = TextEditingController();
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
              decoration: InputDecoration(
                labelText: 'Número da conta',
                hintText: '0000',
              ),
              style: TextStyle(
                fontSize: 24.0,
              ),
              keyboardType: TextInputType.number,
              controller: _controllerFieldNumberAccount,
            ),
          ),Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: 'Valor',
                hintText: '0,00',
              ),
              style: TextStyle(
                fontSize: 24.0,
              ),
              keyboardType: TextInputType.number,
              controller: _controllerFieldValue,
            ),
          ),
          ElevatedButton(
            child: Text('Confirmar'),
            onPressed: () {
              final int numberAccount = int.tryParse(_controllerFieldNumberAccount.text);
              final double valueAccount = double.tryParse(_controllerFieldValue.text);
              if(numberAccount != null && valueAccount != null) {
                final transferCreated = Transfer(numberAccount, valueAccount);
                debugPrint('$transferCreated');
              }
            },
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

  @override
  String toString() {
    return 'Transfer{accountNumber: $accountNumber, value: $value}';
  }

  Transfer(this.accountNumber, this.value);
}
