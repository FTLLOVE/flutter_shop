/**
 * @author: FTL
 * @date: 2019-12-23 13:36
 * @desc: 购物车
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provide/provide.dart';
import '../provide/Counter.dart';
import '../provide/CategoryList.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("购物车"),
        ),
        body: Center(
          child: Stack(
            alignment: FractionalOffset(0.5, 0.5),
            children: <Widget>[
              Container(
                height: 80,
                width: 80,
                child: Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.fill,
                ),
              ),
              Text("hello")
            ],
          ),
        ));
  }

//  List<Widget> buildDataList(List originList) {
//    originList.map((item) {
//      return Text("${item.mallSubName}");
//    });
//  }
}

class Number extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Provide<Counter>(builder: (context, child, val) {
        return Text(
          "${val.value}",
          style: TextStyle(fontSize: 30),
        );
      }),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          Provide.value<Counter>(context).increaseNum();
        },
        child: Text("点我"),
      ),
    );
  }
}
