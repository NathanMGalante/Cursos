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
  final TextEditingController _controllerFieldNumberAccount =
      TextEditingController();
  final TextEditingController _controllerFieldValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Transferência'),
      ),
      body: Column(
        children: [
          Editor(controller: _controllerFieldNumberAccount, label: 'Número da conta', tip: '000'),
          Editor(controller: _controllerFieldValue, label: 'Valor', tip: '0,00',icon: Icons.monetization_on),
          ElevatedButton(
            child: Text('Confirmar'),
            onPressed: () => _transferCreate(),
          ),
        ],
      ),
    );
  }

  void _transferCreate() {
    final int numberAccount =
        int.tryParse(_controllerFieldNumberAccount.text);
    final double valueAccount =
        double.tryParse(_controllerFieldValue.text);
    if (numberAccount != null && valueAccount != null) {
      final transferCreated = Transfer(numberAccount, valueAccount);
    }
  }
}

class Editor extends StatelessWidget {
  
  final TextEditingController controller;
  final String label;
  final String tip;
  final IconData icon;

  Editor({this.controller, this.label, this.tip, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: label,
          hintText: tip,
        ),
        style: TextStyle(
          fontSize: 24.0,
        ),
        keyboardType: TextInputType.number,
        controller: controller,
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
