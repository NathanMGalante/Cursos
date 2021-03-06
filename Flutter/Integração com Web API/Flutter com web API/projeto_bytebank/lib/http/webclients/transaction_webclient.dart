import 'dart:convert';

import 'package:http/http.dart';
import 'package:projeto_bytebank/models/Transaction.dart';

import '../web_client.dart';

class TransactionWebClient {
  final Uri _url = Uri.http('192.168.15.22:8080', 'transactions');

  Future<List<Transaction>> findAll() async {
    final Response response = await client
        .get(
          _url,
        )
        .timeout(Duration(seconds: 10));
    final List<dynamic> decodeJson = jsonDecode(response.body);
    return decodeJson
        .map((dynamic json) => Transaction.fromJson(json))
        .toList();
  }

  Future<Transaction> save(Transaction transaction) async {
    final String transactionJson = jsonEncode(transaction.toJson());

    final Response response = await client.post(
      _url,
      headers: {'Content-Type': 'application/json', 'password': '1000'},
      body: transactionJson,
    );

    return Transaction.fromJson(jsonDecode(response.body));
  }
}
