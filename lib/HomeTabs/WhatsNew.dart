import 'dart:math';
import 'package:firstlesson/Models/POST.dart';
import 'package:firstlesson/api/PostAPI.dart';
import 'package:firstlesson/singlepost.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class WHATSNEW extends StatefulWidget {
  @override
  _WHATSNEWState createState() => _WHATSNEWState();
}

class _WHATSNEWState extends State<WHATSNEW> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            _drawHeader(),
            _drawTopStories()
          ],crossAxisAlignment: CrossAxisAlignment.start,),
      color: Color.fromRGBO(250,250, 250, 1), ),
    );
  }

  Widget _drawHeader(){return  FutureBuilder(
      future: POSTAPI().fetchAllPosts(),
      builder:(context,AsyncSnapshot a){

        switch(a.connectionState){

          case ConnectionState.none:
          // TODO: Handle this case.
            break;
          case ConnectionState.active:
            Loading();
            break;
          case ConnectionState.done:
            if(a.error != null) {
              return Container(child: Text(a.error.toString()),);
            }
            else{
              if (a.hasData){
                List<Post>posts = a.data;
                Random random = new Random();
                int currentIndex = random.nextInt(posts.length);
                Post post = posts[currentIndex];

                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return SinglePost(post);
                    }));
                  },
                  child: Container(decoration:BoxDecoration(image: DecorationImage(image: NetworkImage(post.featured_image)))
                    ,width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height*0.25
                    ,child: Center(
                        child:Column(
                          children: <Widget>[
                            Text(post.title, textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(post.content.substring(0,50)
                                  ,textAlign: TextAlign.center,style:
                                  TextStyle(color: Colors.white,fontSize: 12)),
                            ),
                          ],mainAxisAlignment: MainAxisAlignment.center,
                        )),),
                );

              }
            }
            break;

          case ConnectionState.waiting:
            return Loading();
            break;
        }


      }
    );}
  Widget _drawTopStories(){
    return Container(
      color: Colors.grey.shade100,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16,top: 16),
            child: _drawSectionTitle("Top Stories"),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Card(
              child: FutureBuilder(
                future: POSTAPI().fetchAllPosts(),
                builder: (context,AsyncSnapshot a){
                  switch(a.connectionState){

                    case ConnectionState.none:
                      // TODO: Handle this case.
                      break;
                    case ConnectionState.active:
                      Loading();
                      break;
                    case ConnectionState.done:
                      if(a.error != null) {
                        return Container(child: Text(a.error.toString()),);
                      }
                      else{
                        if (a.hasData){
                          Post post1 = a.data[0];
                          Post post2 = a.data[1];
                          Post post3 = a.data[2];

                          return  Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              _drawSingleRow(post1)
                              ,_drawDivider(),
                              _drawSingleRow(post2),
                              _drawDivider(),
                              _drawSingleRow(post3)
                            ],
                          );
                        }else{

                        }
                      }
                      break;

                    case ConnectionState.waiting:
                     return Loading();
                      break;
                  }

                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child:
            Column(crossAxisAlignment:CrossAxisAlignment.start,children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _drawSectionTitle("Recent Updates"),
              ),
              FutureBuilder(
                  future: POSTAPI().fetchAllRecentPosts(),
                  builder: (context,AsyncSnapshot a){
                    switch(a.connectionState){
                      case ConnectionState.none:
                      // TODO: Handle this case.
                        break;
                      case ConnectionState.active:
                       return Loading();
                        break;
                      case ConnectionState.done:
                        if(a.error != null) {
                          return Container(child: Text(a.error.toString()),);
                        }
                        else{
                          if (a.hasData){
                            List<Post>posts = a.data;
                            List<Widget>widgets = new List<Widget>();
                            for (var item in posts){
                              widgets.add(_drawRecentUpdatesCard(item));
                            }
                            return Column(
                              children: widgets,
                            );
                          }
                          
                        }
                        break;

                      case ConnectionState.waiting:
                        return Loading();
                        break;
                    }

                  }),
              SizedBox(height: 48,)
            ],),
          )
        ],
      ),
    );
  }

  Widget _drawSingleRow(Post post){
   return InkWell(
     onTap: (){
       Navigator.push(context, MaterialPageRoute(builder: (context)=> SinglePost(post)));
     },
     child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(children: <Widget>[
          SizedBox(
            child: Image.network(post.featured_image,fit: BoxFit.cover)
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
  Widget _drawDivider() {
    return Container(
      color: Colors.grey.shade100,
      width: double.infinity,
      height: 10,
    );
  }
  Widget _drawSectionTitle(String txt){
    return Text(txt,style: TextStyle(color:Colors.grey.shade700,
        fontWeight: FontWeight.w700,fontSize: 16),);
  }
  Widget _drawRecentUpdatesCard(Post post){
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SinglePost(post)));
      },
      child: Card(
          child: Column(crossAxisAlignment:CrossAxisAlignment.start,children: <Widget>[
            Container(
              child: Image.network(post.featured_image,fit: BoxFit.cover,),
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.25,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.deepOrange,borderRadius: BorderRadius.circular(4)),
                padding: EdgeInsets.only(left: 16,top: 8,bottom: 8,right: 16),
                child: Text("Sports",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),),
            ),
            Padding(
              padding:EdgeInsets.only(left: 16,right: 16,top:8 ,bottom: 8),
              child: Text(post.title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
            ),
            Padding(padding:EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 16),
            child: Row(children: <Widget>[
              Icon(Icons.timer,color: Colors.grey,size: 16,),
              SizedBox(width: 4,),
              Text(parseHumanate(post.data_written),style: TextStyle(color: Colors.grey,fontSize: 12),)
            ],),),

          ],),
      ),
    );
  }
  Widget Loading(){
    return Container(child: Center(
      child: CircularProgressIndicator(),
    ),);
  }

}
