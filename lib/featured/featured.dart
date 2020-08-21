import 'package:flutter/material.dart';

class Featured extends StatefulWidget {
  @override
  _FeaturedState createState() => _FeaturedState();
}

class _FeaturedState extends State<Featured> {
  Widget header() {
    return Container(
        margin: EdgeInsets.only(left: 10),
        child: Text('Only For You',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)));
  }

  Widget featureCard(int index) {
    return Container(
        width: 240,
        child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    Container(
                        height: 120,
                        child: SizedBox.expand(
                            child: FittedBox(
                                fit: BoxFit.fitWidth,
                                alignment: Alignment.center,
                                child: Image.network(
                                    'https://images.unsplash.com/photo-1473093226795-af9932fe5856?ixlib=rb-1.2.1&auto=format&fit=crop&w=985&q=80')))),
                    ListTile(
                      title: Text('El Pritobonara',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          )),
                      subtitle: Text('White pasta with random leaves'),
                    )
                  ],
                ))));
  }

  Widget featuredListView(BuildContext context, int index) {
    if (index == 0) return SizedBox.fromSize(size: Size(15, 1));
    return featureCard(
        index); //replace with conditional adjusting margin instead
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        header(),
        Container(
          child: ListView.builder(
            itemBuilder: featuredListView,
            itemCount: 10,
            scrollDirection: Axis.horizontal,
          ),
          height: 200,
          margin: EdgeInsets.only(top: 5),
        )
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
