import 'package:flutter/cupertino.dart';

/**
 * @author: FTL
 * @date: 2019-12-23 13:36
 * @desc: 购物车
 */
import 'package:flutter/material.dart';
import 'package:flutter_app/dao/data_base_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/common/spinkit.dart';
import 'package:toast/toast.dart';

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
      ),
      body: FutureBuilder(
        future: db.getTotalList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List list = snapshot.data;
            return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    padding:
                        EdgeInsets.only(left: 5, right: 10, top: 10, bottom: 5),
                    child: Row(
                      children: <Widget>[
                        Checkbox(
                            value: true,
                            activeColor: Colors.pinkAccent,
                            onChanged: (bool val) {
                              setState(() {});
                            }),
                        Image.network(
                          "${list[index]['image']}",
                          fit: BoxFit.fill,
                          height: ScreenUtil().setHeight(120),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            alignment: Alignment.centerLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                          if (list[index]['count'] == 1) {
                                            Toast.show("该宝贝不能减少了哟", context,
                                                backgroundRadius: 5);
                                          } else {
                                            String goodId =
                                                list[index]['goodId'];
                                            db.getItem(goodId).then((val) {
                                              val.count = val.count - 1;
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
                                            style: TextStyle(fontSize: 15),
                                          ),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  right: BorderSide(
                                                      color:
                                                          Color(0xffe8e7e8)))),
                                        ),
                                      ),
                                      Expanded(
                                          child: Container(
                                        alignment: Alignment.center,
                                        child: Text("${list[index]['count']}"),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                right: BorderSide(
                                                    color: Color(0xffeeedee)))),
                                      )),
                                      InkWell(
                                        onTap: () {
                                          String goodId = list[index]['goodId'];
                                          db.getItem(goodId).then((val) {
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
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xffeeedee))),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          padding: EdgeInsets.only(bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  size: 17,
                                  color: Colors.grey,
                                ),
                                onPressed: () {},
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 10, top: 5),
                                child: Text(
                                  "￥${list[index]['price']}",
                                  style: TextStyle(color: Color(0xff161516)),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Color(0xffe8e7e8)))),
                  );
                });
          } else {
            return Center(
              child: Spinkit(),
            );
          }
        },
      ),
    );
  }
}
