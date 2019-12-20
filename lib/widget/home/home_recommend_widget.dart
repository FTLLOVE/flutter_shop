import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeRecommendWidget extends StatelessWidget {
  final List recommondList;

  HomeRecommendWidget({Key key, @required this.recommondList})
      : super(key: key);

  Widget titleContainer = Container(
    margin: EdgeInsets.only(top: 2),
    padding: EdgeInsets.only(
      left: 10,
      bottom: 2,
    ),
    alignment: Alignment.centerLeft,
    child: Text(
      "热门推荐",
      style: TextStyle(color: Color(0xffdf1581)),
    ),
    decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xffeeeeee)))),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 2),
          height: 10,
          color: Color(0xfff2f2f2),
        ),
        titleContainer,
        Container(
          height: ScreenUtil().setHeight(320),
          child: ListView.builder(
              itemCount: recommondList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return RecommendItemWidget(
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
  final String image;
  final double price;
  final double mallPrice;

  RecommendItemWidget(
      {Key key,
      @required this.image,
      @required this.price,
      @required this.mallPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(5),
        width: ScreenUtil().setHeight(250),
        child: Column(
          children: <Widget>[
            Image.network(
              image,
              fit: BoxFit.fill,
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
