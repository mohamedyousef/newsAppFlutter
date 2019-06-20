import 'package:firstlesson/Models/Author.dart' ;
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthorAPI {

  String URL_API="http://phplaravel-250848-858792.cloudwaysapps.com/api/authors";

  Future<List<Author>> fetchAllAuthor() async {

    List<Author>authorlist = new List<Author>();
    var response = await http.get(URL_API);
    if (response.statusCode == 200) {
      var jsondata = jsonDecode(response.body);
      var data = jsondata['data'];

      for(var item in data){
            Author author = Author(item['id'],item['name'],item['email'],item['avatar']);
            authorlist.add(author);
       }

      return authorlist;
    }
  }
}