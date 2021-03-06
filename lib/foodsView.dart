import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uidesign/popularFoods.dart';

import 'Foods.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FirstRow(),
            secondRow(),
            buildPopularCard(),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      shadowColor: Colors.white,
      leading: IconButton(
        disabledColor: Colors.black,
        icon: const Icon(Icons.arrow_back),
      ),
      actions: <Widget>[
        IconButton(
          disabledColor: Colors.black,
          icon: const Icon(Icons.menu),
        ),
      ],
    );
  }

  Row FirstRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 8.0, 0, 0),
                child: Text(
                  'What do you want',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 8.0),
                child: Text(
                  'to eat today?',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 50.0,
          height: 50.0,
          child: const Card(
            child: IconButton(
              color: Colors.black,
              disabledColor: Colors.black,
              icon: const Icon(Icons.search),
            ),
          ),
        ),
      ],
    );
  }

  SizedBox secondRow() => SizedBox(
        height: 200,
        child: ListView.builder(
          itemCount: foods.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    children: [
                      Expanded(
                          flex: 6,
                          child: Container(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image.asset(
                                    foods[index].image,
                                    fit: BoxFit.cover,
                                  )))),
                      Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Text("  " + foods[index].title + " - "),
                              Text(foods[index].number + " items",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ],
                          )),
                    ],
                  ),
                ));
          },
        ),
      );

  Expanded buildPopularCard() {
    return Expanded(
      child: Card(
        color: Colors.white54,
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            favorites(),
            thirdPart(),
          ],
        ),
      ),
    );
  }

  Row favorites() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 30.0, 0, 0),
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: const Card(
                  color: Colors.red,
                  child: IconButton(
                    color: Colors.white,
                    disabledColor: Colors.white,
                    icon: const Icon(Icons.favorite),
                  )),
            )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 32.0, 0, 0),
              child: Text('Popular',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 1.0, 0, 0),
              child: Text('Monggo, entekno duwekmu!'),
            ),
          ],
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 30.0, 0, 0),
          child: IconButton(
            color: Colors.black,
            disabledColor: Colors.black,
            icon: const Icon(Icons.arrow_forward),
          ),
        ),
      ],
    );
  }

  Expanded thirdPart() {
    return Expanded(
        child: Container(
            padding: EdgeInsets.only(top: 20),
            child: SizedBox(
              child: ListView.builder(
                  itemCount: popularfoods.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return buildVerticalCard(context, index);
                  }),
            )));
  }

  Card buildVerticalCard(BuildContext context, int index) {
    return Card(
        child: Container(
      height: MediaQuery.of(context).size.height * 0.17,
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildPopularImage(index),
          Expanded(
            flex: 6,
            child: Container(
                padding: EdgeInsets.fromLTRB(10.0, 5.0, 0, 3.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildPopularTitle(index),
                    SizedBox(
                      height: 4,
                    ),
                    Expanded(
                      flex: 5,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildFirstTag(),
                          SizedBox(
                            width: 6,
                          ),
                          buildSecondTag()
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(2.0, 5.0, 0, 3.0),
                            child: Text(
                              'Warunk Buyakruk',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Spacer(),
                          buildPopularPrice(index),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    ));
  }

  Padding buildPopularPrice(int index) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 5.0, 0, 3.0),
      child: Text(popularfoods[index].price,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
    );
  }

  SizedBox buildSecondTag() {
    return SizedBox(
      width: 115.0,
      height: 20.0,
      child: RaisedButton(
        onPressed: () {},
        color: Colors.deepPurple,
        shape: StadiumBorder(),
        child: Text(
          'Makanan Ringan',
          style: TextStyle(
              fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  SizedBox buildFirstTag() {
    return SizedBox(
      width: 100.0,
      height: 20.0,
      child: RaisedButton(
        onPressed: () {},
        color: Colors.pinkAccent,
        shape: StadiumBorder(),
        child: Text(
          'Gorengan',
          style: TextStyle(
              fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Expanded buildPopularTitle(int index) {
    return Expanded(
      flex: 3,
      child: Text(popularfoods[index].title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  Expanded buildPopularImage(int index) {
    return Expanded(
        flex: 3,
        child: Container(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  popularfoods[index].image,
                  fit: BoxFit.cover,
                ))));
  }
}
