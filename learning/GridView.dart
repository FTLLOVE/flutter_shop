import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter",
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: BasicGridView()),
    );
  }
}

class BasicGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: GridView.count(
        padding: EdgeInsets.all(10),
        crossAxisCount: 4,
        childAspectRatio: 0.8,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: <Widget>[
          Container(
            color: Colors.red,
            height: 30,
          ),
          Container(
            color: Colors.orange,
            height: 30,
          ),
          Container(
            color: Colors.yellow,
            height: 30,
          ),
          Container(
            color: Colors.green,
            height: 30,
          ),
          Container(
            color: Colors.blueGrey,
            height: 30,
          ),
          Container(
            color: Colors.blueAccent,
            height: 30,
          ),
          Container(
            color: Colors.purpleAccent,
            height: 30,
          )
        ],
      ),
    );
  }
}
