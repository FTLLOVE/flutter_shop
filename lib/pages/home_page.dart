/**
 * @author: FTL
 * @date: 2019/12/19 14:48
 * @desc: 首页
 */
import 'package:flutter/material.dart';
import 'package:flutter_app/widget/common/spinkit.dart';
import 'package:flutter_app/widget/home/home_advertise_banner_widget.dart';
import 'package:flutter_app/widget/home/home_call_phone_widget.dart';
import 'package:flutter_app/widget/home/home_floor_widget.dart';
import 'package:flutter_app/widget/home/home_recommend_widget.dart';
import 'package:flutter_app/widget/home/home_swiper_widget.dart';
import 'package:flutter_app/widget/home/home_top_navigation_widget.dart';
import '../service/service_method.dart';
import 'dart:convert';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import '../widget/home/home_hot_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  int _currentPage = 1;
  List<Map> hotGoodList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("百姓生活+"),
        elevation: 0,
      ),
      body: FutureBuilder(
          future: getHomeContent(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = json.decode(snapshot.data.toString());
              List<Map> swiperList = (data['data']['slides'] as List).cast();
              List<Map> navigationList =
                  (data['data']['category'] as List).cast();
              String advertesPicture =
                  data['data']['advertesPicture']['PICTURE_ADDRESS'];
              String leaderImage = data['data']['shopInfo']['leaderImage'];
              String leaderPhone = data['data']['shopInfo']['leaderPhone'];
              List<Map> recommendList =
                  (data['data']['recommend'] as List).cast();
              String floor1Pic = data['data']['floor1Pic']['PICTURE_ADDRESS'];
              String floor2Pic = data['data']['floor2Pic']['PICTURE_ADDRESS'];
              String floor3Pic = data['data']['floor3Pic']['PICTURE_ADDRESS'];
              List<Map> floor1 = (data['data']['floor1'] as List).cast();
              List<Map> floor2 = (data['data']['floor2'] as List).cast();
              List<Map> floor3 = (data['data']['floor3'] as List).cast();
              return EasyRefresh(
                child: ListView(
                  children: <Widget>[
                    HomeSwiperWidget(
                      swiperList: swiperList,
                    ),
                    HomeTopNavigationWidget(
                      navigationList: navigationList,
                    ),
                    HomeAdvertiseBannerWidget(
                      picture: advertesPicture,
                    ),
                    HomeCallPhoneWidget(
                      avatar: leaderImage,
                      telephone: leaderPhone,
                    ),
                    HomeRecommendWidget(recommondList: recommendList),
                    Column(
                      children: <Widget>[
                        HomeFloorWidget(
                          floorTitlePic: floor1Pic,
                          floorPicList: floor1,
                        ),
                        HomeFloorWidget(
                          floorTitlePic: floor2Pic,
                          floorPicList: floor2,
                        ),
                        HomeFloorWidget(
                          floorTitlePic: floor3Pic,
                          floorPicList: floor3,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 2),
                          height: 10,
                          color: Color(0xfff2f2f2),
                        ),
                        HomeHotWidget(
                          hotGoods: hotGoodList,
                        ),
                      ],
                    ),
                  ],
                ),
                onLoad: () async {
                  var formData = {"page": _currentPage};
                  await getHomePageBelowContent(formData).then((val) {
                    var data = json.decode(val.toString());
                    List<Map> goodList = (data['data'] as List).cast();
                    setState(() {
                      hotGoodList.addAll(goodList);
                      _currentPage++;
                    });
                  });
                },
                footer: ClassicalFooter(
                    showInfo: false,
                    bgColor: Colors.white,
                    loadReadyText: "准备加载",
                    loadingText: "加载中",
                    loadedText: "无更多数据",
                    noMoreText: "无更多数据"),
                firstRefreshWidget: Spinkit(),
              );
            } else {
              return Center(
                child: Spinkit(),
              );
            }
          }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
