///
/// @author: FTL
/// @date: 2019-12-31 16:54
/// @desc: 购物车
///
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/dao/data_base_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toast/toast.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    var db = DatabaseHelper();
    return Scaffold(
      appBar: AppBar(
        title: Text("购物车"),
        elevation: 0,
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: db.getTotalList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var list = snapshot.data['list'];
            var sum = snapshot.data['sum'];
            if (list.length > 0) {
              return Stack(
                children: <Widget>[
                  Positioned(
                    child: Container(
                      padding: EdgeInsets.only(bottom: 50),
                      child: ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 100,
                              padding: EdgeInsets.only(
                                  left: 5, right: 10, top: 10, bottom: 5),
                              child: Row(
                                children: <Widget>[
                                  Checkbox(
                                      value: true,
                                      activeColor: Colors.pinkAccent,
                                      onChanged: (bool val) {
                                        setState(() {});
                                      }),
                                  CachedNetworkImage(
                                    fit: BoxFit.fill,
                                    imageUrl: "${list[index]['image']}",
                                    placeholder: (context, url) {
                                      return Image.asset(
                                        "assets/images/logo.png",
                                        fit: BoxFit.fill,
                                        height: ScreenUtil().setHeight(120),
                                      );
                                    },
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(left: 10),
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            child: Text(
                                              "${list[index]['name']}",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            height: 25,
                                            width: 100,
                                            child: Row(
                                              children: <Widget>[
                                                InkWell(
                                                  onTap: () {
                                                    if (list[index]['count'] ==
                                                        1) {
                                                      Toast.show(
                                                          "该宝贝不能减少了哟", context,
                                                          backgroundRadius: 5);
                                                    } else {
                                                      String goodId =
                                                          list[index]['goodId'];
                                                      db
                                                          .getItem(goodId)
                                                          .then((val) {
                                                        val.count =
                                                            val.count - 1;
                                                        db.updateItem(val);
                                                        setState(() {});
                                                      });
                                                    }
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    width: 20,
                                                    child: Text(
                                                      "-",
                                                      style: TextStyle(
                                                          fontSize: 15),
                                                    ),
                                                    decoration: BoxDecoration(
                                                        border: Border(
                                                            right: BorderSide(
                                                                color: Color(
                                                                    0xffe8e7e8)))),
                                                  ),
                                                ),
                                                Expanded(
                                                    child: Container(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                      "${list[index]['count']}"),
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                          right: BorderSide(
                                                              color: Color(
                                                                  0xffeeedee)))),
                                                )),
                                                InkWell(
                                                  onTap: () {
                                                    String goodId =
                                                        list[index]['goodId'];
                                                    db
                                                        .getItem(goodId)
                                                        .then((val) {
                                                      val.count = val.count + 1;
                                                      db.updateItem(val);
                                                      setState(() {});
                                                    });
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    width: 20,
                                                    child: Text(
                                                      "+",
                                                      style: TextStyle(
                                                          fontSize: 15),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Color(0xffeeedee))),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 100,
                                    padding: EdgeInsets.only(bottom: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(
                                            Icons.delete,
                                            size: 17,
                                            color: Colors.grey,
                                          ),
                                          onPressed: () {
                                            YYDialog().build(context)
                                              ..width = 240
                                              ..borderRadius = 4.0
                                              ..margin =
                                                  EdgeInsets.only(top: 20)
                                              ..barrierDismissible = false
                                              ..text(
                                                padding: EdgeInsets.all(25.0),
                                                alignment: Alignment.center,
                                                text: "确定删除该商品吗?",
                                                color: Colors.black,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w500,
                                              )
                                              ..divider()
                                              ..doubleButton(
                                                padding:
                                                    EdgeInsets.only(top: 10.0),
                                                gravity: Gravity.center,
                                                withDivider: true,
                                                text1: "我再想想",
                                                fontSize1: 13.0,
                                                color1: Colors.grey,
                                                fontWeight1: FontWeight.bold,
                                                onTap1: () {},
                                                text2: "确定",
                                                color2: Color(0xffdf1581),
                                                fontSize2: 13.0,
                                                fontWeight2: FontWeight.bold,
                                                onTap2: () {
                                                  db.deleteItem(
                                                      list[index]['goodId']);
                                                  Toast.show("删除成功", context,
                                                      backgroundRadius: 5);
                                                  setState(() {});
                                                },
                                              )
                                              ..show();
                                          },
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: 10, top: 5),
                                          child: Text(
                                            "￥${list[index]['price']}",
                                            style: TextStyle(
                                                color: Color(0xffdf1581)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Color(0xffe8e7e8)))),
                            );
                          }),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 5, right: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Checkbox(
                            value: true,
                            onChanged: (val) {},
                            activeColor: Color(0xffdf1581),
                          ),
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                "合计:    ￥$sum",
                                style: TextStyle(color: Color(0xffdf1581)),
                              ),
                              Text(
                                "免运费",
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(20),
                                    color: Colors.grey),
                              )
                            ],
                          )),
                          InkWell(
                            onTap: () async {
                              Toast.show("结算成功", context, backgroundRadius: 5);
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              padding: EdgeInsets.only(left: 15, right: 15),
                              alignment: Alignment.center,
                              height: ScreenUtil().setHeight(50),
                              child: Text(
                                "结算",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ScreenUtil().setSp(26)),
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xffdf1581),
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                          )
                        ],
                      ),
                      height: ScreenUtil().setHeight(80),
                    ),
                  )
                ],
              );
            } else {
              return Center(
                child: Text(
                  "购物车空空如也...",
                  style: TextStyle(fontSize: 16),
                ),
              );
            }
          } else {
            return Center(
              child: Text(
                "购物车空空如也...",
                style: TextStyle(fontSize: 16),
              ),
            );
          }
        },
      ),
    );
  }
}
