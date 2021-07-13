import 'package:flutter/material.dart';
import 'package:projeto_bytebank/components/editor.dart';
import 'package:projeto_bytebank/models/transfer.dart';

const _title_appBar = 'Criar Transferência';
const _laber_numberAccount = 'Número da conta';
const _tip_numberAccount = '000';
const _laber_value = 'Valor';
const _tip_value = '00.0';
const _confirm_button = 'Confirmar';

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
        title: Text(_title_appBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
                controller: widget._controllerFieldNumberAccount,
                label: _laber_numberAccount,
                tip: _tip_numberAccount),
            Editor(
                controller: widget._controllerFieldValue,
                label: _laber_value,
                tip: _tip_value,
                icon: Icons.monetization_on),
            ElevatedButton(
              child: Text(_confirm_button),
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
