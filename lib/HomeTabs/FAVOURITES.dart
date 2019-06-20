import 'package:flutter/material.dart';

class FAVOURITE extends StatefulWidget {
  @override
  _FAVOURITEState createState() => _FAVOURITEState();
}

class _FAVOURITEState extends State<FAVOURITE> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context,index){
      return Card(child:Container(padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            _authorRow(),
            SizedBox(height: 16,),
            newItemRow()
          ],
        ),
      ));
    },itemCount: 20,);
  }

  Widget _authorRow(){
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween  ,
      children: <Widget>[
        makeTobarAuthorRow("mohamed yousef"),
        IconButton(onPressed: (){},icon:Icon(Icons.bookmark_border),)
      ],
    );
  }
  Widget newItemRow(){
    return Row(children: <Widget>[
      Container(decoration: BoxDecoration(
        color: Colors.black),width: 124,height: 124,margin: EdgeInsets.only(right:16),),
      Expanded(
        child: Column(children: <Widget>[
          Text("Tech social artical news hellow",
              style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600)),
          Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. 's standard dummy",
          style: TextStyle(color: Colors.grey,fontSize: 16,height: 1.25),)
        ],),
      )
    ],);
  }

  Widget makeTobarAuthorRow(String name){
    return  Row(children: <Widget>[
      Container(
        margin:EdgeInsets.only(right: 15),
        decoration: BoxDecoration(color: Colors.black87,shape: BoxShape.circle),width: 60,height: 60,),
      Column(
      crossAxisAlignment: CrossAxisAlignment.start
      ,children: <Widget>[
        Text(name),
        SizedBox(height: 8,),
        Row(children: <Widget>[
          Text("15 min") ,
          Text("Life Style")
        ],)
      ],)
    ],);
  }

}
