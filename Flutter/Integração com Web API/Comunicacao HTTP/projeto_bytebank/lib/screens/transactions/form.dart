import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projeto_bytebank/components/response_dialog.dart';
import 'package:projeto_bytebank/components/transaction_auth_dialog.dart';
import 'package:projeto_bytebank/http/webclients/transaction_webclient.dart';
import 'package:projeto_bytebank/models/Transaction.dart';
import 'package:projeto_bytebank/models/contact.dart';

class TransactionForm extends StatefulWidget {
  final Contact contact;

  TransactionForm(this.contact);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final TextEditingController _valueController = TextEditingController();
  final TransactionWebClient _webClient = TransactionWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New transaction'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.contact.name,
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  widget.contact.accountNumber.toString(),
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _valueController,
                  style: TextStyle(fontSize: 24.0),
                  decoration: InputDecoration(labelText: 'Value'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    child: Text('Transfer'),
                    onPressed: () {
                      final double value =
                          double.tryParse(_valueController.text);
                      final transactionCreated =
                          Transaction(value, widget.contact);
                      showDialog(
                        context: context,
                        builder: (contextDialog) => TransactionAuthDialog(
                          onConfirm: (String password) {
                            _save(transactionCreated, password, context);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _save(Transaction transactionCreated, String password,
      BuildContext context) async {
    final Transaction transaction = await _webClient
        .save(transactionCreated, password)
        .catchError((error) => _showFailureDialog(context, error.message),
            test: (error) => error is HttpException)
        .catchError(
            (error) => _showFailureDialog(
            context, 'Timeout submitting the transaction'),
        test: (error) => error is TimeoutException);

    if (transaction != null) {
      await _showSuccessfulDialog(context);
      Navigator.pop(context);
    }
  }

  void _showFailureDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (contextDialog) => FailureDialog(message),
    );
  }

  Future _showSuccessfulDialog(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (contextDialog) => SuccessDialog('Successful transaction'));
  }
}
