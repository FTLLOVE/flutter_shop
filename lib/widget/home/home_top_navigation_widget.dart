/**
 * @author: FTL
 * @date: 2019/12/19 14:47
 * @desc: 首页顶部导航组件
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTopNavigationWidget extends StatelessWidget {
  final List navigationList;

  HomeTopNavigationWidget({Key key, @required this.navigationList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.navigationList.length > 10) {
      this.navigationList.removeRange(10, this.navigationList.length);
    }

    return Container(
      height: ScreenUtil().setHeight(275),
      padding: EdgeInsets.all(10),
      child: GridView.count(
        crossAxisCount: 5,
        childAspectRatio: 1,
        children: this.navigationList.map((item) {
          return HomeNavigationItemWidget(
              image: item['image'], navigationName: item['mallCategoryName']);
        }).toList(),
      ),
    );
  }
}

/// 首页顶部导航item
class HomeNavigationItemWidget extends StatelessWidget {
  final String image;

  final String navigationName;

  HomeNavigationItemWidget(
      {Key key, @required this.image, @required this.navigationName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: <Widget>[
          Image.network(
            this.image,
            height: ScreenUtil().setHeight(80),
          ),
          Text(
            this.navigationName,
            style: TextStyle(fontSize: 13),
          )
        ],
      ),
    );
  }
}
