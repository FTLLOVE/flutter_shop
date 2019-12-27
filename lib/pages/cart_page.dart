import 'package:flutter/gestures.dart';

/**
 * @author: FTL
 * @date: 2019-12-23 13:36
 * @desc: 购物车
 */
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
          length: 2,
          child: Scaffold(
              appBar: AppBar(
                title: Text("购物车"),
                bottom: TabBar(
                  tabs: <Widget>[
                    Text("1"),
                    Text("1"),
                  ],
                  isScrollable: true,
                ),
              ),
              body: TabBarView(children: <Widget>[
                Text("我是Java"),
                Text("我是Golang"),
              ]))),
    );
  }
}
