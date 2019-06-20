import 'package:firstlesson/NavMenus/Facebook_feed.dart';
import 'package:firstlesson/NavMenus/HedaLineNews.dart';
import 'package:firstlesson/NavMenus/InstgramFeed.dart';
import 'package:firstlesson/NavMenus/twitter_feed.dart';
import 'package:firstlesson/Pages/contact.dart';
import 'package:firstlesson/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:firstlesson/Models/NavMenueItem.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  List<String>navMenu=['Explore','HeadLine News','Read Later','Videos','Photos','Settings','Logout'];

 static  bool islog =  false;

  List<NavMenueItem>navigationmenu = [
    NavMenueItem("Explore",()=> HomeScreen()),
    NavMenueItem("HeadLineNews",()=>HeadLineNews()),
    NavMenueItem("TwitterFeed",()=>TwitterFeed()),
    NavMenueItem("Instgram Feed",()=>InstgramFeed()),
    NavMenueItem("Facebook Feed",()=>FacebookFeed()),
    NavMenueItem("Contacr Us ",()=>CONTACT()),
  ];

  _checkToken()async{
    SharedPreferences token = await SharedPreferences.getInstance();
    String tok =  token.getString("token");
    setState(() {
      if (tok.isEmpty || tok==null)
      {
        islog = false;
      }else
        islog = true;
    });
  }

  logOut()async{
    SharedPreferences token = await SharedPreferences.getInstance();
    setState(() {
      String tok  = token.getString("token");
      if (tok.isNotEmpty || tok !=null)
          token.remove("token");
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  //  _checkToken();
    if(islog) {
      navigationmenu.add(NavMenueItem("Logout", () => FacebookFeed()));
    }else{
      navigationmenu.add(NavMenueItem("Login",()=>FacebookFeed()));
      navigationmenu.add(NavMenueItem("Register",()=>FacebookFeed()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(child: Padding(
      padding: EdgeInsets.only(left: 24,top: 75),
      child: ListView.builder(itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(navigationmenu[index].title,style: TextStyle(color: Colors.grey.shade700,fontSize: 22),),
            trailing: Icon(Icons.chevron_right,color: Colors.grey.shade400,),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>navigationmenu[index].destination()));
            },
          ),
        );
      },itemCount: navigationmenu.length,),
    ),);
  }
}
