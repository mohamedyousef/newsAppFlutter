import 'package:firstlesson/Models/POST.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class POSTAPI{

  String URL_API="http://phplaravel-250848-858792.cloudwaysapps.com/api/posts/categories/1";
  String URL_API2="http://phplaravel-250848-858792.cloudwaysapps.com/api/posts/categories/2";
  String URL_API3="http://phplaravel-250848-858792.cloudwaysapps.com/api/posts/categories/3";

  Future<List<Post>> fetchAllPosts()async{
    var response = await http.get(URL_API);
    List<Post>posts =new  List<Post>();

    if(response.statusCode == 200) {
      var jsondata = jsonDecode(response.body);
      var data = jsondata['data'];
      for(var item in data){
        Post post=new Post(
          title: item['title'].toString()
            ,id: item['id'].toString(),
            content: item['content'].toString(),
            data_written: item['date_written'],
            featured_image: item['featured_image'],
            categoryID: item['category_id'],
            userID: item['user_id'],
          votesUp: item['votes_up'],
          votesDown: item['votes_down'],
          votersup: (item['voters_up']==null) ? List<int>():jsonDecode(item['voters_up']),
          votersdown: (item['voters_down']==null) ? List<int>():jsonDecode(item['voters_down']),
        ); posts.add(post);

      }

    }
    return posts;
  }
  Future<List<Post>> fetchAllRecentPosts()async{
    var response = await http.get(URL_API2);
    List<Post>posts = new List<Post>();

    if(response.statusCode == 200) {
      var jsondata = jsonDecode(response.body);
      var data = jsondata['data'];
      for(var item in data){
        Post post=new Post(
          title: item['title'].toString()
          ,id: item['id'].toString(),
          content: item['content'].toString(),
          data_written: item['date_written'],
          featured_image: item['featured_image'],
          categoryID: item['category_id'],
          userID: item['user_id'],
          votesUp: item['votes_up'],
          votesDown: item['votes_down'],
          votersup: (item['voters_up']==null) ? List<int>():jsonDecode(item['voters_up']),
          votersdown: (item['voters_down']==null) ? List<int>():jsonDecode(item['voters_down']),
        ); posts.add(post);

      }

    }
    return posts;
  }
  Future<List<Post>> fetchPopular()async{
    var response = await http.get(URL_API2);
    List<Post>posts = new List<Post>();

    if(response.statusCode == 200) {
      var jsondata = jsonDecode(response.body);
      var data = jsondata['data'];
      for(var item in data){
        Post post=new Post(
          title: item['title'].toString()
          ,id: item['id'].toString(),
          content: item['content'].toString(),
          data_written: item['date_written'],
          featured_image: item['featured_image'],
          categoryID: item['category_id'],
          userID: item['user_id'],
          votesUp: item['votes_up'],
          votesDown: item['votes_down'],
          votersup: (item['voters_up']==null) ? List<int>():jsonDecode(item['voters_up']),
          votersdown: (item['voters_down']==null) ? List<int>():jsonDecode(item['voters_down']),
        );
        posts.add(post);
      }

    }
    return posts;
  }

}