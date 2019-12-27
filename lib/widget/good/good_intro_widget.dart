import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class GoodIntroWidget extends StatefulWidget {
  final String goodsDetail;

  final String goodComments;

  GoodIntroWidget(
      {Key key, @required this.goodsDetail, @required this.goodComments})
      : super(key: key);

  @override
  _GoodIntroWidgetState createState() => _GoodIntroWidgetState();
}

class _GoodIntroWidgetState extends State<GoodIntroWidget>
    with SingleTickerProviderStateMixin {
  TabController controller;
  var tabs = <Tab>[];
  bool isLeft = true;
  bool isRight = false;

  @override
  void initState() {
    isLeft = true;
    isRight = false;
    tabs = [
      Tab(
        text: "商品详情",
      ),
      Tab(
        text: "商品评论",
      )
    ];
    controller = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isLeft = true;
                      isRight = false;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    alignment: Alignment.center,
                    child: Text(
                      "商品详情",
                      style: TextStyle(
                          color:
                              isLeft ? Color(0xffdd2081) : Color(0xff000000)),
                    ),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: isLeft
                                    ? Color(0xffdd2081)
                                    : Color(0xfffffff),
                                width: isLeft ? 2 : 0))),
                  ),
                ),
              ),
              Expanded(
                  child: InkWell(
                onTap: () {
                  setState(() {
                    isLeft = false;
                    isRight = true;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "商品评论",
                    style: TextStyle(
                        color: isRight ? Color(0xffdd2081) : Color(0xff000000)),
                  ),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: isRight
                                  ? Color(0xffdd2081)
                                  : Color(0xfffffff),
                              width: isRight ? 2 : 0))),
                ),
              ))
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5),
          child: isLeft
              ? Html(data: widget.goodsDetail)
              : Text(
                  "没的数据",
                  style: TextStyle(fontSize: 18),
                ),
        )
      ],
    );
  }
}
