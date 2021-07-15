import 'package:flutter/material.dart';
import 'package:projeto_bytebank/models/transfer.dart';
import 'package:projeto_bytebank/screens/transfers/form.dart';

const _title_appBar = 'Transferências';

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
        title: Text(_title_appBar),
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
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TransferForm()))
              .then((transferReceived) => _update(transferReceived));
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
  final Transfer _transfer;

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
