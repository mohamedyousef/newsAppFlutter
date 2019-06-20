import 'package:firstlesson/shared_ul/navigation_drawer.dart';
import 'package:flutter/material.dart';

class TwitterFeed extends StatefulWidget {
  @override
  _TwitterFeedState createState() => _TwitterFeedState();
}

class _TwitterFeedState extends State<TwitterFeed> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Twitter Feed"),centerTitle: false,
      actions: <Widget>[
        IconButton(icon: Icon(Icons.search),onPressed: (){},),
        IconButton(icon: Icon(Icons.more_vert),onPressed: (){},),
      ],),
      drawer: NavigationDrawer(),
      body: ListView.builder(itemBuilder: (context,index){
        return Card(child: Column(children: <Widget>[
          CardHeader(),
          CardBody(),
          drawLine(),
          CardFooter()
        ],),);
      },itemCount: 20,),
    );
  }

  Widget CardHeader(){
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(children: <Widget>[
        CircleAvatar(backgroundColor: Colors.purple,radius: 24,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          Row(children: <Widget>[Text("Mohamed Yousef"),Text("@ch_mayers")],),
          SizedBox(height: 8,),
          Text("16 min friday")
        ],)
      ],),
    );
  }
  Widget CardBody(){
    return Padding(
      padding: const EdgeInsets.only(right:16,left: 16,bottom: 8),
      child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. 's standard dummy"),
    );
  }
  Widget CardFooter(){
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween
      ,children: <Widget>[
        Row(
          children: <Widget>[
            IconButton(icon: Icon(Icons.repeat,color: Colors.orange,),onPressed: (){},),
            Text("25"),
          ],
        ),

        Row(
          children: <Widget>[
            FlatButton(onPressed: (){},child: Text("Share",style: TextStyle(color: Colors.orange)),),
            FlatButton(onPressed: (){},child: Text("Opem",style: TextStyle(color: Colors.orange),),),
          ],
        )

      ],),
    );
  }
  Widget drawLine(){
    return Container(
      color: Colors.grey.shade600,
      margin: EdgeInsets.only(top: 10,bottom: 10),
    );
  }
  
}
