import 'package:flutter/material.dart';
import 'package:firstlesson/OnBoarding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homescreen.dart';
import 'utils/AppTheme.dart';

void main() async {
 SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  Widget _widget;

  bool seen = sharedPreferences.getBool("seen");
  if (seen==null||seen==false) {
    _widget = OnBoarding();
  }  else
    _widget= HomeScreen();

  runApp(NewsApp(_widget));
}

class NewsApp extends StatelessWidget {
  Widget widget;
  NewsApp(this.widget);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: this.widget,debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
    );

  }
}



