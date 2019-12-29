import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widget/good/good_intro_widget.dart';
import 'package:flutter_app/widget/good/good_middle_widget.dart';
import '../service/service_method.dart';
import '../widget/good/good_top_widget.dart';
import '../widget/common/spinkit.dart';
import 'package:toast/toast.dart';
import '../dao/data_base_helper.dart';
import '../model/cart_model.dart';

class GoodDetailPage extends StatefulWidget {
  String goodId;

  GoodDetailPage({Key key, @required this.goodId}) : super(key: key);

  @override
  _GoodDetailPageState createState() => _GoodDetailPageState();
}

class _GoodDetailPageState extends State<GoodDetailPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    var formData = {"goodId": widget.goodId};
    var db = DatabaseHelper();
    return Scaffold(
      appBar: AppBar(
        title: Text("商品详情"),
        elevation: 0,
      ),
      body: FutureBuilder(
          future: getGoodDetailById(formData),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = json.decode(snapshot.data.toString());
              String goodId = data['data']['goodInfo']['goodsId'].toString();
              String image1 = data['data']['goodInfo']['image1'].toString();
              String goodsName =
                  data['data']['goodInfo']['goodsName'].toString();
              int amount = data['data']['goodInfo']['amount'];
              double oriPrice = data['data']['goodInfo']['oriPrice'];
              double presentPrice = data['data']['goodInfo']['presentPrice'];
              String goodsDetail = data['data']['goodInfo']['goodsDetail'];
              String goodComments = data['data']['goodInfo']['goodComments'];
              return Stack(
                children: <Widget>[
                  Positioned(
                      child: ListView(
                    children: <Widget>[
                      GoodTopWidget(
                        image: image1,
                      ),
                      GoodMiddleWidget(
                        goodName: goodsName,
                        amount: amount,
                        oriPrice: oriPrice,
                        presentPrice: presentPrice,
                      ),
                      GoodIntroWidget(
                        goodsDetail: goodsDetail,
                        goodComments: goodComments,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5, bottom: 15),
                        alignment: Alignment.center,
                        child: Text(
                          "我也是有底线的...",
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                    ],
                  )),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 45,
                        child: Row(
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                Toast.show("开发中...", context);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                color: Colors.white,
                                width: width / 7,
                                child: Icon(
                                  Icons.shopping_cart,
                                  color: Color(0xffdd2081),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                String id = widget.goodId;
                                Toast.show("添加成功", context,
                                    backgroundRadius: 5);
                                db.getItem(id).then((val) {
                                  if (val != null) {
                                    val.count = val.count + 1;
                                    db.updateItem(val);
                                  } else {
                                    CartModel cartModel = CartModel();
                                    cartModel.id = null;
                                    cartModel.goodId = id;
                                    cartModel.name = goodsName;
                                    cartModel.image = image1;
                                    cartModel.price = presentPrice;
                                    cartModel.count = 1;
                                    db.saveItem(cartModel);
                                  }
                                });
                              },
                              child: Container(
                                width: width * 3 / 7,
                                color: Colors.green,
                                alignment: Alignment.center,
                                child: Text(
                                  "加入购物车",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Toast.show("开发中...", context);
                              },
                              child: Container(
                                width: width * 3 / 7,
                                alignment: Alignment.center,
                                color: Colors.redAccent,
                                child: Text(
                                  "立即购买",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              );
            } else {
              return Center(
                child: Spinkit(),
              );
            }
          }),
    );
  }
}
