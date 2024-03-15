import 'dart:convert';

import 'package:http/http.dart' as http;

class APICode{
    Future<List> getdetail() async {
      var res= await http.get(Uri.parse("https://64e8603a99cf45b15fdf77ff.mockapi.io/faculty"));
      List userList= jsonDecode(res.body);
      return userList;
    }
    Future<void> deletRecord(String id) async {
      var res= await http.delete(Uri.parse("https://64e8603a99cf45b15fdf77ff.mockapi.io/faculty/"+id));

    }
}