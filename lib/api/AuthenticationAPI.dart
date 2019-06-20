import 'package:http/http.dart' as http ;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Authentication{

  String authAPI = "http://phplaravel-250848-858792.cloudwaysapps.com/api/token/";
  // ignore: non_constant_identifier_names
  Future<bool> Login(String email,String password)async{
    Map<String,String>header = {"Accept":"application/json","Content-type":"application/x-www-form-urlencoded"};
    Map<String,String>body = {"email":email,"password":password};
    var  response =  await  http.post(authAPI,headers: header,body: body);
    if(response.statusCode == 200) {
      var jsonData =jsonDecode(response.body);
      var data = jsonData['data'];
      var token = data['token'];
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString("token", token);
      return true;
    }
    return false;
  }

}

