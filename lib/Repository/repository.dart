import 'dart:convert';



import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../model/Usermodel.dart';
import '../model/customermodel.dart';
class WebServise{

  Future<List<Customerlist>> callProfileApi() async {
    var url = Uri.parse('https://crudcrud.com/api/92a0efa9de4d461ba902e7bce3c2171e/unicorns/');
    var response = await http.get(url );
    if(response.statusCode==200){
      print('Response status: ${response.statusCode}');
      print('Response body: ${jsonDecode(response.body)}');
      return  customerlistFromJson(response.body);
    }

    return  customerlistFromJson(response.body);
  }
  Future<http.Response> delete(id) async {
    var url = Uri.parse('https://crudcrud.com/api/92a0efa9de4d461ba902e7bce3c2171e/unicorns/$id');
    var response = await http.delete(url );
    // if(response.statusCode==200){
    //   print('Response status: ${response.statusCode}');
    //   print('Response body: ${jsonDecode(response.body)}');
    //   return  response;
    // }

    return  response;
  }
  Future<http.Response> update(id,name, state, city, image, dob) async {
    var url = Uri.parse('https://crudcrud.com/api/92a0efa9de4d461ba902e7bce3c2171e/unicorns/$id');
    Map<String, String> body = {
      'name': name,
      'state': state,
      'city':city,
      'image':image,
      'dob': dob,

    };
    print(body);
    var response = await http.put(url,headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
      body: jsonEncode(body), );
    if(response.statusCode==200||response.statusCode==201){
      print('Response status: ${response.statusCode}');
      print('Response body: ${jsonDecode(response.body)}');
      Fluttertoast.showToast(msg: 'Customer Updated');

      return  response;
    }
    else{
      Fluttertoast.showToast(msg: 'Something went wrong');
    }
    return  response;
  }
  Future<http.Response> add(name, country, state, city, image, dob) async {
    var url = Uri.parse('https://crudcrud.com/api/92a0efa9de4d461ba902e7bce3c2171e/unicorns/');
    Map<String, String> body = {
        'name': name,
        'state': state,
        'city':city,
        'image':image,
        'dob': dob,
      };
    print(body);
    var response = await http.post(url,headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(body), );
    if(response.statusCode==200||response.statusCode==201){
      print('Response status: ${response.statusCode}');
      print('Response body: ${jsonDecode(response.body)}');
      Fluttertoast.showToast(msg: 'Customer added');

      return  response;
    }
else{
  Fluttertoast.showToast(msg: 'Something went wrong');
    }
    return  response;
  }
}