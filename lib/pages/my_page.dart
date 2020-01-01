///
/// @author: FTL
/// @date: 2019-12-31 16:55
/// @desc: 我的
///
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:toast/toast.dart';
import '../constants.dart' show Constants, AppColors;
import '../routes/routers.dart';
import 'order_page.dart';
import 'login_page.dart';
import 'webview_page.dart';
import 'map_page.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with AutomaticKeepAliveClientMixin {
  Widget _itemWidget(String title) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      alignment: Alignment.center,
      height: ScreenUtil().setHeight(85),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "${title}",
            style: TextStyle(fontSize: ScreenUtil().setSp(28)),
          ),
          Icon(
            Icons.chevron_right,
            color: Color(AppColors.RightIconColor),
          )
        ],
      ),
      decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(color: Color(AppColors.DividerColor), width: 2))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            height: ScreenUtil().setHeight(220),
            color: Color(AppColors.PrimaryColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: ScreenUtil().setHeight(140),
                  height: ScreenUtil().setWidth(140),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://cdn.jsdelivr.net/gh/flutterchina/website@1.0/images/flutter-mark-square-100.png"),
                      )),
                ),
                Container(
                  child: Text(
                    "豆芽菜不爱吃豆芽",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              goPage(
                  context,
                  OrderPage(
                    currentIndex: 0,
                  ));
            },
            child: Container(
              padding: EdgeInsets.only(left: 15),
              alignment: Alignment.centerLeft,
              height: ScreenUtil().setHeight(80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "我的订单",
                        style: TextStyle(
                          color: Color(0xff2a2c2c),
                          fontSize: ScreenUtil().setSp(30),
                        ),
                      )
                    ],
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.chevron_right,
                        color: Color(AppColors.RightIconColor),
                      ),
                      onPressed: () {})
                ],
              ),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Color(0xfff9f7f9), width: 2))),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InkWell(
                  child: Column(
                    children: <Widget>[
                      // 343634
                      Icon(
                        IconData(0xe621, fontFamily: Constants.IconfontFamily),
                        color: Color(AppColors.OrderIconColor),
                        size: 30,
                      ),
                      Container(
                        height: 5,
                      ),
                      Text(
                        "待付款",
                        style: TextStyle(
                            color: Color(AppColors.OrderIconColor),
                            fontSize: 13),
                      )
                    ],
                  ),
                  onTap: () {
                    goPage(
                        context,
                        OrderPage(
                          currentIndex: 1,
                        ));
                  },
                ),
                InkWell(
                  child: Column(
                    children: <Widget>[
                      // 343634
                      Icon(
                        IconData(0xe6d4, fontFamily: Constants.IconfontFamily),
                        color: Color(AppColors.OrderIconColor),
                        size: 29,
                      ),
                      Container(
                        height: 6,
                      ),
                      Text(
                        "待发货",
                        style: TextStyle(
                            color: Color(AppColors.OrderIconColor),
                            fontSize: 13),
                      )
                    ],
                  ),
                  onTap: () {
                    goPage(
                        context,
                        OrderPage(
                          currentIndex: 2,
                        ));
                  },
                ),
                InkWell(
                  child: Column(
                    children: <Widget>[
                      // 343634
                      Icon(
                        IconData(0xe640, fontFamily: Constants.IconfontFamily),
                        color: Color(AppColors.OrderIconColor),
                        size: 33,
                      ),
                      Container(
                        height: 5,
                      ),
                      Text(
                        "待收货",
                        style: TextStyle(
                            color: Color(AppColors.OrderIconColor),
                            fontSize: 13),
                      )
                    ],
                  ),
                  onTap: () {
                    goPage(
                        context,
                        OrderPage(
                          currentIndex: 3,
                        ));
                  },
                ),
                InkWell(
                  child: Column(
                    children: <Widget>[
                      Icon(
                        IconData(0xe627, fontFamily: Constants.IconfontFamily),
                        color: Color(AppColors.OrderIconColor),
                        size: 28,
                      ),
                      Container(
                        height: 7,
                      ),
                      Text(
                        "待评价",
                        style: TextStyle(
                            color: Color(AppColors.OrderIconColor),
                            fontSize: 13),
                      )
                    ],
                  ),
                  onTap: () {
                    goPage(context, OrderPage(currentIndex: 4));
                  },
                )
              ],
            ),
          ),
          Container(
            height: 15,
            color: Color(AppColors.DividerBgColor),
          ),
          InkWell(
            child: _itemWidget("地址管理"),
            onTap: () {},
          ),
          InkWell(
            child: _itemWidget("已领取优惠券"),
            onTap: () {},
          ),
          InkWell(
            child: _itemWidget("地址管理"),
            onTap: () {},
          ),
          InkWell(
            child: _itemWidget("联系客服"),
            onTap: () {},
          ),
          InkWell(
            child: _itemWidget("关于我"),
            onTap: () {
              goPage(
                  context,
                  WebviewPage(
                    title: "关于我",
                    url: "https://ftllove.github.io/",
                  ));
            },
          ),
          InkWell(
            child: _itemWidget("设置"),
            onTap: () {
              goPage(context, MapPage());
            },
          ),
          Container(
            height: ScreenUtil().setHeight(40),
          ),
          InkWell(
            child: Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              alignment: Alignment.center,
              height: ScreenUtil().setHeight(70),
              child: Text("退出登录",
                  style: TextStyle(
                      color: Colors.white, fontSize: ScreenUtil().setSp(32))),
              decoration: BoxDecoration(
                  color: Color(AppColors.PrimaryColor),
                  borderRadius: BorderRadiusDirectional.circular(5)),
            ),
            onTap: () {
              goPageAndRemoveUntil(context, LoginPage());
            },
          ),
          Container(
            height: ScreenUtil().setHeight(40),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
