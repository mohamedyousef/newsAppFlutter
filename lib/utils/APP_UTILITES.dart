import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<bool> isloggin()async{
  SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
  bool islog = sharedPreferences.getBool("login");
  if (islog==false ||  islog == null){
    return false;
  }
  return true;
}