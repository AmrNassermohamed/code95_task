import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ServicesHandler {
  Future<dynamic> getService({String? urlSuffix,
    Map<String, String>? headers}) async {
    var request = http.Request('GET', Uri.parse('https://mocki.io/v1/56240ba1-44a1-4559-a759-8f93179dafbf'));
    http.StreamedResponse response = await request.send();
    var responsee = await http.Response.fromStream(response);
    if (responsee.statusCode == 200) {
      return json.decode(responsee.body);
    }
    else {
      print(response.reasonPhrase);
    }
  }
}