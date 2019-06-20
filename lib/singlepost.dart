import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Models/POST.dart';

class SinglePost extends StatefulWidget {
  final Post post;

  SinglePost(this.post);

  @override
  _SinglePostState createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.40,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.post.featured_image),
                          fit: BoxFit.cover))),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              if (index == 0)
                return _drawPostDetails();
              else if (index >= 1 && index <= 24)
                return comments();
              else {
                if (index == 25) return commentsTextEntry();
              }
            }),
          )
        ],
      ),
    );
  }
  Widget _drawPostDetails() {
    return Container(
      padding: EdgeInsets.all(8),
      child: Text(
        widget.post.content,
        style: TextStyle(fontSize: 18, letterSpacing: 1.2, height: 1.2),
      ),
    );
  }
  Widget comments() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            CircleAvatar(backgroundColor: Colors.blueAccent),
            SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[Text("Mohamed Yousef"), Text("one Hours")],
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Text("")
      ],
    );
  }
  Widget commentsTextEntry() {
    return Container(
      color: Color.fromRGBO(241, 245, 247, 1),
      child: Row(
        children: <Widget>[
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16, left: 16),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter Your Comment Here",
                  fillColor: Colors.transparent,
                  filled: true,
                  contentPadding: EdgeInsets.only(left: 16,top: 24,bottom: 28)
                ),
              ),
            ),
          ),
          FlatButton(textColor: Colors.red,onPressed: (){},child: Text("SEND"),padding: EdgeInsets.only(bottom: 10),)
        ],
      ),
    );
  }

}
