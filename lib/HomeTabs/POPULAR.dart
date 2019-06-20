import 'package:firstlesson/Models/POST.dart';
import 'package:firstlesson/api/PostAPI.dart';
import 'package:firstlesson/singlepost.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class POPULARS extends StatefulWidget {
  @override
  _POPULARSState createState() => _POPULARSState();
}

class _POPULARSState extends State<POPULARS> {

  @override
  Widget build(BuildContext context) {
    return
      FutureBuilder(
        future: POSTAPI().fetchPopular(),
        builder:(context,AsyncSnapshot a) {
          List<Post>data =a.data;
          switch(a.connectionState){
            case ConnectionState.none:
            // TODO: Handle this case.
              break;
            case ConnectionState.waiting:
              return Loading();
              break;
            case ConnectionState.active:
              return Loading();
              break;
            case ConnectionState.done:
             return ListView.builder(itemBuilder: (context,index){
                return Card(
                  child:_drawSingleRow(a.data[index]),
                );
              },itemCount: data.length ,);
              break;
          }},
      );
  }
  Widget Loading(){
    return Container(child: Center(
      child: CircularProgressIndicator(),
    ),);
  }
  Widget _drawSingleRow(Post post){
    return InkWell(
      onLongPress: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SinglePost(post) ));
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(children: <Widget>[
          SizedBox(
            child: Image.network(post.featured_image,fit: BoxFit.cover,)
            ,width: 124,height: 124,) ,
          SizedBox(width: 16,)
          , Expanded(
            child: Column(mainAxisAlignment:MainAxisAlignment.spaceBetween
              ,children: <Widget>[
                Text(post.title,maxLines: 2,
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                SizedBox(height: 16,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Michael Adams"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(parseHumanate(post.data_written))
                        ,Icon(Icons.timer)],),],)
              ],),
          )
        ],),
      ),
    );
  }
  String parseHumanate(String datetime){
    Duration timeago2  = new DateTime.now().difference(DateTime.parse(datetime));
    DateTime date = DateTime.now().subtract(timeago2);
    return timeago.format(date);
  }

}
