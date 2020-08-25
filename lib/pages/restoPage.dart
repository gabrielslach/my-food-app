import 'package:flutter/material.dart';

class Category {
  String imgUrl;
  String name;

  Category(name, imgUrl) {
    this.imgUrl = imgUrl;
    this.name = name;
  }
}

class RestoPage extends StatelessWidget {
  final _bannerImg =
      'https://www.mcdelivery.com.ph/uploads/images//MDS-NoDelivFee_MDSBanner_660x500.jpg';

  final _categories = <Category>[
    Category('Favorite Meals',
        'https://i0.wp.com/www.eatthis.com/wp-content/uploads/2016/12/mcdonalds-fast-food.jpg?fit=1024%2C750&ssl=1'),
    Category('All Products',
        'https://urmajestysire.files.wordpress.com/2014/04/bff-burger-bundle-product-shot.png'),
    Category('Group Meals',
        'https://images.summitmedia-digital.com/yummyph/images/2020/07/01/mcdonalds-group-selection.jpg'),
    Category('Happy Meals',
        'https://consequenceofsound.net/wp-content/uploads/2017/01/happy_meal_34.jpg?quality=80'),
    Category('Mega Meals',
        'https://www.sheknows.com/wp-content/uploads/2019/04/mcdonalds-international.jpg'),
    Category('Burger & Fries',
        'https://thumbor.thedailymeal.com/snpqwZIspZdEuzx2xw_5qkrABx4=/870x565/filters:focal(859x480:860x481)/https://www.thedailymeal.com/sites/default/files/story/2018/mcdonaldsmain-dreamstime.JPG')
  ];

  Widget _categoryWidget(String imgUrl, String name, BuildContext context) {
    void _goToRestoMenu(String name) {
      Navigator.of(context).pushNamed('/restoMenuPage');
      return;
    }

    return Container(
        decoration: BoxDecoration(
            color: Colors.yellow[800],
            image: DecorationImage(
                image: NetworkImage(imgUrl), fit: BoxFit.cover)),
        child: Material(
            color: Colors.transparent,
            child: InkWell(
                splashColor: Colors.orange[200],
                onTap: () {
                  _goToRestoMenu(name);
                },
                child: Center(
                    child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    shadows: [Shadow(blurRadius: 10)],
                  ),
                )))));
  }

  Widget _banner() {
    return Container(
      height: 250,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.red[300],
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: NetworkImage(_bannerImg), fit: BoxFit.cover)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('McDonalds Plaridel'),
          backgroundColor: Colors.red[900],
        ),
        body: ListView(
          children: [
            _banner(),
            Container(
                margin: EdgeInsets.all(5),
                child: GridView.count(
                  crossAxisCount: 2,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: (3 / 2),
                  children: _categories
                      .map((e) => _categoryWidget(e.imgUrl, e.name, context))
                      .toList(),
                ))
          ],
        ));
  }
}
