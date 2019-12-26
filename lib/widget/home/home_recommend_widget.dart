/**
 * @author: FTL
 * @date: 2019-12-21 16:38
 * @desc: 首页推荐组件
 */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../routes/routers.dart';
import '../../pages/good_detail_page.dart';

class HomeRecommendWidget extends StatelessWidget {
  final List recommondList;

  HomeRecommendWidget({Key key, @required this.recommondList})
      : super(key: key);

  Widget titleContainer = Container(
    margin: EdgeInsets.only(top: 2),
    padding: EdgeInsets.only(left: 10, bottom: 4, top: 3),
    alignment: Alignment.centerLeft,
    child: Text(
      "热门推荐",
      style: TextStyle(color: Color(0xffdf1581), fontSize: 16),
    ),
    decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xffeeeeee)))),
  );

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 2),
          height: 10,
          color: Color(0xfff2f2f2),
        ),
        titleContainer,
        Container(
          height: (width / 2) * 0.92,
          child: ListView.builder(
              itemCount: recommondList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return RecommendItemWidget(
                    goodsId: recommondList[index]['goodsId'],
                    image: recommondList[index]['image'],
                    price: recommondList[index]['mallPrice'],
                    mallPrice: recommondList[index]['price']);
              }),
        )
      ],
    );
  }
}

class RecommendItemWidget extends StatelessWidget {
  final String goodsId;
  final String image;
  final double price;
  final double mallPrice;

  RecommendItemWidget(
      {Key key,
      @required this.goodsId,
      @required this.image,
      @required this.price,
      @required this.mallPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        goPage(context, GoodDetailPage(goodId: goodsId));
      },
      child: Container(
        padding: EdgeInsets.all(5),
        width: width / 3,
        child: Column(
          children: <Widget>[
            CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: this.image,
              placeholder: (context, url) {
                return Container(
                  height: ScreenUtil().setHeight(200),
                  color: Colors.grey,
                  child: Text("加载中"),
                  alignment: Alignment.center,
                );
              },
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Text("￥${price}"),
            Text(
              "￥ ${mallPrice}",
              style: TextStyle(
                  decoration: TextDecoration.lineThrough, color: Colors.grey),
            )
          ],
        ),
        decoration: BoxDecoration(
            color: Color(0xffffffff),
            border: Border(right: BorderSide(color: Color(0xffeeeeee)))),
      ),
    );
  }
}
