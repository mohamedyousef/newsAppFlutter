import 'package:firstlesson/Models/Category.dart';
import 'package:http/http.dart' as http ;
import 'dart:convert';

class CategoriesApi{

  String URL_API="http://phplaravel-250848-858792.cloudwaysapps.com/api/categories";

  Future<List<Category>> fetchALLCategories() async {
    List<Category>categories = new List<Category>();
    var response = await http.get(URL_API);
    if (response.statusCode == 200) {
      var jsondata = jsonDecode(response.body);
      var data = jsondata['data'];
      for(var item in data){
        categories.add(new Category(item['id'],item['title']));
      }
    }
    return categories;
  }
}