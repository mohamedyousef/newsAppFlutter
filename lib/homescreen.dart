import 'package:firstlesson/Models/Author.dart';
import 'package:firstlesson/Pages/help.dart';
import 'package:flutter/material.dart';
import 'Pages/about.dart';
import 'Pages/contact.dart';
import 'shared_ul/navigation_drawer.dart';
import 'HomeTabs/WhatsNew.dart';
import 'HomeTabs/POPULAR.dart';
import 'HomeTabs/FAVOURITES.dart';
import 'api/author_api.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

enum popOutMenu{
  HELP,ABOUT,CONTACT
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{


  AuthorAPI authorAPI = new AuthorAPI();

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0,length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Explore"),centerTitle: false,actions: <Widget>[
        IconButton(icon: Icon(Icons.search),onPressed: (){},),
        _popOUTMen()
      ],bottom: TabBar(tabs: [
        Tab(text: "WHATS NEW ",icon: Icon(Icons.ac_unit),),
        Tab(text: "POPULAR ",icon: Icon(Icons.recent_actors)),
        Tab(text: "FAVOURITES",icon: Icon(Icons.star)),
      ],controller:_tabController,indicatorColor: Colors.white,),),
      body:Center(
        child: TabBarView(children: [
          WHATSNEW(),
          POPULARS(),
          FAVOURITE()
        ],controller: _tabController,),
    ),
      drawer: NavigationDrawer(),
    );

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  Widget _popOUTMen() {
    return PopupMenuButton(itemBuilder: (context){
      return [
        PopupMenuItem<popOutMenu>(
          value: popOutMenu.ABOUT,
          child: Text("ABOUT"),
        ),PopupMenuItem<popOutMenu>(
          value: popOutMenu.HELP,
          child: Text("HELP"),
        ),PopupMenuItem<popOutMenu>(
          value: popOutMenu.CONTACT,
          child: Text("CONTACT"),
        )
      ];
    },onSelected: (popOutMenu pop){
      switch(pop){
        case popOutMenu.ABOUT:
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ABOUT()));
        break;
        case popOutMenu.CONTACT:
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CONTACT()));
          break;
        case popOutMenu.HELP:
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HELP()));
          break;
      }
    },icon: Icon(Icons.more_vert),);
  }
}
