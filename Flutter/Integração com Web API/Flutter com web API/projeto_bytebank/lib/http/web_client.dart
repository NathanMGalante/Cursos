import 'package:http/http.dart';

void findAll() async{
  final Response response = await get('http://192.168.15.22:8080/transactions');
  print(response.body);
}