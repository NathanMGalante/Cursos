import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {

  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print('Request');
    print('url: ${data.url}');
    print('readers: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    print('Response');
    print('status: ${data.statusCode}');
    print('readers: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }
}


void findAll() async {
  final Client client =
  InterceptedClient.build(interceptors: [LoggingInterceptor()]);
  final Response response =
  await client.get(Uri.http('192.168.15.22:8080', 'transactions'));
}
