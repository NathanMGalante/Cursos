import 'dart:convert';

import 'package:http/http.dart';
import 'package:projeto_bytebank/models/Transaction.dart';

import '../web_client.dart';

class TransactionWebClient {
  final Uri _url =
      Uri.http('192.168.15.22:8080', 'transactions'); //farm192.168.1.8
  //final Uri _url = Uri.http('192.168.1.8:8080', 'transactions'); //casa

  Future<List<Transaction>> findAll() async {
    final Response response = await client.get(_url);
    final List<dynamic> decodeJson = jsonDecode(response.body);
    return decodeJson
        .map((dynamic json) => Transaction.fromJson(json))
        .toList();
  }

  Future<Transaction> save(Transaction transaction, String password) async {
    final String transactionJson = jsonEncode(transaction.toJson());

    await Future.delayed(Duration(seconds: 10));

    final Response response = await client.post(
      _url,
      headers: {'Content-Type': 'application/json', 'password': password},
      body: transactionJson,
    ).timeout(Duration(seconds: 5));
    if (response.statusCode == 200)
      return Transaction.fromJson(jsonDecode(response.body));

    throw HttpException(_statusCodeResponses[response.statusCode]);
  }

  static final Map<int, String> _statusCodeResponses = {
    400: 'There was an error',
    401: 'Authentication failed',
  };
}

class HttpException implements Exception {
  final String message;

  HttpException(this.message);
}
