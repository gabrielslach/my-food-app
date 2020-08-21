import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'featured/featured.dart';
import 'home_storelist/home_storelist.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.orange[900],
        )),
        title: 'First Food App',
        home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  Widget searchField() {
    return Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: TextField(
            decoration: InputDecoration(
          filled: true,
          enabledBorder: InputBorder.none,
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
        )));
  }

  Widget childPadding(Widget child) {
    return Padding(padding: EdgeInsets.only(bottom: 15), child: child);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
      SliverAppBar(
        leading: Container(
            padding: EdgeInsets.fromLTRB(12, 6, 0, 6),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://www.woolha.com/media/2020/03/eevee.png',
              ),
              maxRadius: 15,
              backgroundColor: Colors.blue[300],
              foregroundColor: Colors.lightBlue[900],
            )),
        expandedHeight: 230,
        flexibleSpace: FlexibleSpaceBar(
          title: Text(
            'My Food App',
          ),
          centerTitle: true,
          background: Image.network(
              'https://images.unsplash.com/photo-1505826759037-406b40feb4cd?ixlib=rb-1.2.1&auto=format&fit=crop&w=1052&q=80',
              fit: BoxFit.cover),
        ),
        stretch: true,
        pinned: true,
        onStretchTrigger: () {
          print('heyt');
          return;
        },
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
              margin: EdgeInsets.only(top: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    childPadding(searchField()),
                    childPadding(Featured()),
                    childPadding(StoreList())
                  ]));
        },
        childCount: 1,
      ))
    ]));
  }
}
