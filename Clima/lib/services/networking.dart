import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;
  NetworkHelper({this.url});

  Future getData() async {
    var data;
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String responses = response.body;
      data = jsonDecode(responses);
    }
    return data;
  }
}
