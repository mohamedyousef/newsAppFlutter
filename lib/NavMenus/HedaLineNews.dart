import 'package:firstlesson/HomeTabs/FAVOURITES.dart';
import 'package:firstlesson/HomeTabs/POPULAR.dart';
import 'package:flutter/material.dart';
import 'package:firstlesson/shared_ul/navigation_drawer.dart';

class HeadLineNews extends StatefulWidget {
  @override
  _HeadLineNews createState() => _HeadLineNews();
}

class _HeadLineNews extends State<HeadLineNews> with SingleTickerProviderStateMixin{


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
        IconButton(icon: Icon(Icons.more_vert),onPressed: (){},),

      ],bottom: TabBar(tabs: [
        Tab(text: "WHATS NEW ",icon: Icon(Icons.ac_unit),),
        Tab(text: "POPULAR ",icon: Icon(Icons.recent_actors)),
        Tab(text: "FAVOURITES",icon: Icon(Icons.star)),
      ],controller:_tabController,indicatorColor: Colors.white,),),
      body:Center(
        child: TabBarView(children: [
          FAVOURITE(),
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
}
