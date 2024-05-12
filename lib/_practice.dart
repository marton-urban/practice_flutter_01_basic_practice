import 'dart:io';

const port = 8080;
Future<void> main(List<String> arguments) async {
  final httpServer = await createHTTPServer();
  await httpRequest(httpServer);
}

Future<HttpServer> createHTTPServer() async {
  final intAddress = InternetAddress.anyIPv4;
  return await HttpServer.bind(intAddress, port);
}

Future<void> httpRequest(HttpServer server) async {
  await for (HttpRequest request in server) {
    if (request.method == 'GET') {
      request.response
        ..write('''
 { "data": [
 {"title": "January"},
 {"title:": "February"},
 {"title": "March"}
 ] }\n''')
        ..close();
    }
  }
}
