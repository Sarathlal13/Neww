import 'dart:convert';

import 'package:http/http.dart' as http;

class NetWorkingClima {
  NetWorkingClima({this.url});
  String url;
  Future getClimaData() async {
    http.Response resp = await http.get(url);
    if (resp.statusCode == 200) {
      var result = jsonDecode(resp.body);
      return result;
    }
  }
}
