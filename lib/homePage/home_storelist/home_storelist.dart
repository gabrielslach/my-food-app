import 'package:flutter/material.dart';

class StoreList extends StatefulWidget {
  @override
  _StoreListState createState() => _StoreListState();
}

class _StoreListState extends State<StoreList> {
  Widget header() {
    return Container(
        margin: EdgeInsets.only(left: 10, bottom: 5),
        child: Text('Stores Near You',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)));
  }

  Widget storeTile() {
    return Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Card(
            child: ListTile(
          leading: Image.network(
            'https://pbs.twimg.com/profile_images/1278715154717274112/U-8r1RN5.jpg',
            fit: BoxFit.cover,
          ),
          title: Text('McDonalds'),
          subtitle: Text('McArthur Highway, Plaridel'),
          onTap: () {
            Navigator.of(context).pushNamed('/restoPage', arguments: 'heyhey');
          },
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          header(),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 20,
              itemBuilder: (context, index) {
                return storeTile();
              })
        ]);
  }
}
