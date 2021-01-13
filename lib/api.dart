import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class api {
  static Future getData() async {
    var response = await http.get("http://jsonplaceholder.typicode.com/users");
    if (response.statusCode == 200) {
      var res = jsonDecode(response.body);
      return res;
    }
  }
}