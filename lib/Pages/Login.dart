import 'package:firstlesson/api/AuthenticationAPI.dart';
import 'package:firstlesson/homescreen.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final globalKey = GlobalKey<FormState>();

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: (isloading)?drawLoading():drawLoginForm(),
      ),
    );
  }

  Widget drawLoginForm(){
    return Form(
      key: globalKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(hintText: "UserName"),
            validator: (value) {
              if (value.isEmpty) {
                return "Please Enter Your UserName";
              }
              return null;
            },
          ),
          SizedBox(
            height: 16,
          ),
          TextFormField(
              decoration: InputDecoration(labelText: "Password"),
              validator: (value) {
                if (value.isEmpty) {
                  return "Please Enter Your Password";
                }
                return null;
              }),
          SizedBox(
            height: 16,
          ),
          SizedBox(
            child: RaisedButton(
              onPressed: () {
                if (globalKey.currentState.validate()) {
                  setState(() {
                    isloading = true;
                  });

                  var response = new Authentication().Login("","");
                  if (response != null)
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return HomeScreen();
                    }));

                } else {
                  setState(() {
                    isloading = false;
                  });
                }
              },
              child: Text(
                "LOGIN",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.red.shade700,
            ),
            width: double.infinity,
          ),
        ],
      ),
    );
  }
  Widget drawLoading(){
    return Container(child: Center(child: CircularProgressIndicator(),),);
  }

}
