import 'package:flutter/material.dart';
import 'package:projeto_bytebank/components/editor.dart';
import 'package:projeto_bytebank/components/variables.dart';
import 'package:projeto_bytebank/models/transfer.dart';

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
        title: Text(title_appBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
                controller: widget._controllerFieldNumberAccount,
                label: laber_numberAccount,
                tip: tip_numberAccount),
            Editor(
                controller: widget._controllerFieldValue,
                label: laber_value,
                tip: tip_value,
                icon: Icons.monetization_on),
            ElevatedButton(
              child: Text(button_confirm),
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
