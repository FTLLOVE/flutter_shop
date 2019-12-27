import 'package:flutter/material.dart';

class GoodMiddleWidget extends StatelessWidget {
  final String goodName;
  final int amount;
  final double oriPrice;
  final double presentPrice;

  GoodMiddleWidget(
      {Key key,
      @required this.goodName,
      @required this.amount,
      @required this.oriPrice,
      @required this.presentPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            goodName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Color(0xff505050), fontSize: 17),
          ),
          Container(
            padding: EdgeInsets.only(left: 5, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "￥${presentPrice}",
                  style: TextStyle(fontSize: 23, color: Color(0xffdd2081)),
                ),
                Container(
                  child: Text(
                    "市场价: ￥${oriPrice}",
                    style: TextStyle(
                        color: Color(0xff8d8d8d),
                        decoration: TextDecoration.lineThrough),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    "库存:${amount}",
                    style: TextStyle(color: Color(0xff8d8d8d)),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 10,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
