import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TransferList(),
      ),
    );
  }
}

class TransferList extends StatefulWidget {
  final List<Transfer> _transfers = [];

  @override
  State<StatefulWidget> createState() => TransferListState();
}

class TransferListState extends State<TransferList> {
  @override
  Widget build(BuildContext context) {
    // widget é usado para acessar o _transfers da classe pai
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: ListView.builder(
        itemCount: widget._transfers.length,
        itemBuilder: (context, index) {
          final transfer = widget._transfers[index];
          return TransferItem(transfer);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transfer> future = Navigator.push(
              context, MaterialPageRoute(builder: (context) => TransferForm()));
          future.then((transferReceived) => _update(transferReceived));
        },
      ),
    );
  }

  _update(Transfer transferReceived) {
    if (transferReceived != null) {
      Future.delayed(Duration(seconds: 1), () {
        setState(() => widget._transfers.add(transferReceived));
      });
    }
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

class TransferForm extends StatefulWidget {
  final TextEditingController _controllerFieldNumberAccount =
      TextEditingController();
  final TextEditingController _controllerFieldValue = TextEditingController();

  @override
  State<StatefulWidget> createState() => TransferFormState();
}

class TransferFormState extends State<TransferForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Transferência'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
                controller: widget._controllerFieldNumberAccount,
                label: 'Número da conta',
                tip: '000'),
            Editor(
                controller: widget._controllerFieldValue,
                label: 'Valor',
                tip: '0,00',
                icon: Icons.monetization_on),
            ElevatedButton(
              child: Text('Confirmar'),
              onPressed: () => _transferCreate(context),
            ),
          ],
        ),
      ),
    );
  }

  void _transferCreate(BuildContext context) {
    final int numberAccount =
        int.tryParse(widget._controllerFieldNumberAccount.text);
    final double valueAccount =
        double.tryParse(widget._controllerFieldValue.text);
    if (numberAccount != null && valueAccount != null) {
      final transferCreated = Transfer(numberAccount, valueAccount);
      Navigator.pop(context,
          transferCreated); // push coloca a transferencia e o pop tira a transferencia
    }
  }
}

class Transfer {
  final int accountNumber;
  final double value;

  Transfer(this.accountNumber, this.value);

  @override
  String toString() {
    return 'Transfer{accountNumber: $accountNumber, value: $value}';
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
