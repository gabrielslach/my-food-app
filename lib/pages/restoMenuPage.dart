// Flutter code sample for ListTile

// Here is an example of a custom list item that resembles a Youtube related
// video list item created with [Expanded] and [Container] widgets.
//
// ![Custom list item a](https://flutter.github.io/assets-for-api-docs/assets/widgets/custom_list_item_a.png)

import 'package:flutter/material.dart';

class RestoItem {
  RestoItem(
      {this.name,
      this.description,
      this.price,
      this.rating,
      this.reviewCount,
      this.imgUrl});

  final String name;
  final String description;
  final double price;
  final double rating;
  final int reviewCount;
  final String imgUrl;
}

class _ItemDescription extends StatelessWidget {
  const _ItemDescription(
      {Key key,
      this.name,
      this.description,
      this.price,
      this.rating,
      this.reviewCount})
      : super(key: key);

  final String name;
  final String description;
  final double price;
  final double rating;
  final int reviewCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 3.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15.0,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  description,
                  style: const TextStyle(fontSize: 13.0, color: Colors.black54),
                ),
              ]),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                Text(
                  '₱ $price',
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0,
                      color: Colors.red),
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.star, size: 16, color: Colors.yellow[600]),
                    Icon(Icons.star, size: 16, color: Colors.yellow[600]),
                    Icon(Icons.star, size: 16, color: Colors.yellow[600]),
                    Icon(Icons.star, size: 16, color: Colors.yellow[600]),
                    Icon(Icons.star_half, size: 16, color: Colors.yellow[600]),
                    SizedBox(width: 3),
                    Text('($reviewCount)',
                        style: TextStyle(color: Colors.black54, fontSize: 13))
                  ],
                )
              ]))
        ],
      ),
    );
  }
}

class CustomListItem extends StatelessWidget {
  const CustomListItem(
      {this.name,
      this.description,
      this.price,
      this.rating,
      this.reviewCount,
      this.imgUrl});

  final String name;
  final String description;
  final double price;
  final double rating;
  final int reviewCount;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      padding: const EdgeInsets.fromLTRB(10, 8, 8, 8),
      child: Stack(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 120,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(imgUrl))),
            ),
            Expanded(
              child: _ItemDescription(
                name: name,
                description: description,
                price: price,
                rating: rating,
                reviewCount: reviewCount,
              ),
            ),
          ],
        ),
        InkWell(
          onTap: () {},
          splashColor: Colors.orange[200],
        )
      ]),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class RestoMenuPage extends StatelessWidget {
  RestoMenuPage({Key key}) : super(key: key);

  final _restoItemList = <RestoItem>[
    RestoItem(
        name: 'Big Mac',
        description:
            'Multi-layer Burger meal with medium-sized fries and drinks',
        price: 202.00,
        rating: 4.5,
        reviewCount: 493,
        imgUrl:
            'https://mcdelivery.com.ph/uploads/images/BigMcMeal435X320-V1.png'),
    RestoItem(
        name: 'Cheesy Burger McDo',
        description: 'Cheese Burger meal with medium-sized fries and drinks',
        price: 120.00,
        rating: 4.5,
        reviewCount: 503,
        imgUrl:
            'https://mcdelivery.com.ph/uploads/images/CheesyBurgerMeal435X320-V1.png'),
    RestoItem(
        name: '2-pc. Mushroom Pepper Steak w/ Plain Rice & Egg Bowl',
        description: 'Rice meal with medium drinks',
        price: 129.00,
        rating: 4.5,
        reviewCount: 503,
        imgUrl:
            'https://mcdelivery.com.ph/uploads/images/MDSSilogMeal-435x320-2MPScoke-min.png')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('All Products'),
          backgroundColor: Colors.red[900],
        ),
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: _restoItemList.length,
          itemBuilder: ((context, index) {
            return Column(children: [
              CustomListItem(
                  name: _restoItemList[index].name,
                  description: _restoItemList[index].description,
                  price: _restoItemList[index].price,
                  rating: _restoItemList[index].rating,
                  reviewCount: _restoItemList[index].reviewCount,
                  imgUrl: _restoItemList[index].imgUrl),
              Divider(
                height: 1,
              )
            ]);
          }),
        ));
  }
}
