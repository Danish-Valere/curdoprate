import 'dart:convert';

import 'package:http/http.dart' as http;

class ServiceApi {
  String baseUrl = 'https://reqres.in/api/users?page=2';
  Future<List> getData() async {
    try {
      var response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        print(response.body);
        // return jsonDecode(response.body);
        var listData = jsonDecode(response.body);
        return listData['data'];
      } else {
        //server error
        return Future.error('Server Error');
      }
    } catch (SocketException) {
      return Future.error('Error Fetching data');
    }
  }

  Future<String> createPost(Map<String, dynamic> data) async {
    try {
      var response = await http.post(Uri.parse("$baseUrl/create"),
          body: jsonEncode(data),
          headers: {"Content-Type": "application/json; charset = UTF-8"});

      if (response.statusCode == 200) {
        print(response.body);
        return 'success';
      } else {
        //server error
        return 'serror';
      }
    } catch (SocketException) {
      return 'errors';
    }
  }
}
