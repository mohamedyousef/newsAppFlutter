import 'package:flutter/material.dart';


class CONTACT extends StatefulWidget {
  @override
  _CONTACTState createState() => _CONTACTState();
}

class _CONTACTState extends State<CONTACT> {

  final globalKey = GlobalKey<FormState>();
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contact US"),centerTitle: true,),
      body: (isloading)? drawLoading() : drawForm() ,
    );
  }

  Widget drawForm(){
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: globalKey,
        child: Column(children: <Widget>[
          TextFormField(decoration:InputDecoration(labelText: "Enter Your Name"),validator: (value){
            if(value.isEmpty){
              return "Please Enter Your Name";
            }
            return null;
          },),
          TextFormField(decoration:InputDecoration(labelText: "Enter Your Email"),validator: (value){
            if(value.isEmpty){
              return "Please Enter Your Email";
            }
            return null;
          },),
          TextFormField(decoration:InputDecoration(labelText: "  Message"),validator: (value){
            if(value.isEmpty){
              return "Please Enter Your Message";
            }
            return null;
          },maxLines: 4,),
          SizedBox(width: double.infinity,
            child: RaisedButton(color: Colors.red,onPressed: (){
              if(globalKey.currentState.validate()){
                setState(() {
                  isloading = true;
                });
              }
              else {
                setState(() {
                  isloading = false;
                });
              }
            },child: Text("SEND MESSAGE ! " ,style: TextStyle(color: Colors.white),),),)

        ],),
      ),
    );
  }
  Widget drawLoading(){
    return Container(child: Center(child: CircularProgressIndicator(),),);
  }

}
