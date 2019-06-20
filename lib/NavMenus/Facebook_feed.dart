import 'package:firstlesson/shared_ul/navigation_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FacebookFeed extends StatefulWidget {
  @override
  _FacebookFeedState createState() => _FacebookFeedState();
}

class _FacebookFeedState extends State<FacebookFeed> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Instgram Feed"),centerTitle: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),onPressed: (){},),
          IconButton(icon: Icon(Icons.more_vert),onPressed: (){},),
        ],),
      drawer: NavigationDrawer(),
      body: ListView.builder(itemBuilder: (context,index){
        return Card(child: Column(children: <Widget>[
          CardHeader(),
          CardTitle(),
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
      child:
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[
        Row(children: <Widget>[
          CircleAvatar(backgroundColor: Colors.purple,radius: 24,),
          SizedBox(width: 8,)
          ,Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(children: <Widget>[Text("Mohamed Yousef")],),
                SizedBox(height: 2,),
                Text("16 min friday")
              ])
        ],),
        IconButton(icon:Icon(Icons.favorite),onPressed: (){},)
      ],),
    );
  }
  Widget CardBody(){
    return Padding(
      padding: const EdgeInsets.only(right:8,left: 8,bottom: 8),
      child:Container(decoration: BoxDecoration(color: Colors.grey),
        width: double.infinity,height: MediaQuery.of(context).size.height*0.25
        ,margin: EdgeInsets.all(5),),
    );
  }
  Widget CardFooter(){
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween
        ,children: <Widget>[

        FlatButton(onPressed: (){},child: Text("10 COMMENTS"),),

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
  Widget CardTitle(){
    return Padding(
        padding: EdgeInsets.all(10),
        child:Column(
          children: <Widget>[
            Text("We make happy to people wellcome to in the future"),
            Container(child: Wrap(
              children: <Widget>[
                FlatButton(onPressed: (){},child: Text("#advance",style: TextStyle(color: Colors.deepOrange.shade600),),)
                ,FlatButton(onPressed: (){},child: Text("#Coca Cola",style: TextStyle(color: Colors.deepOrange.shade600),),)
              ],
            )),
          ],
        )
    );
  }


}
