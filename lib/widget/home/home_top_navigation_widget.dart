/**
 * @author: FTL
 * @date: 2019/12/19 14:47
 * @desc: 首页顶部导航组件
 */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../routes/routers.dart';
import '../../pages/good_list_page.dart';

class HomeTopNavigationWidget extends StatelessWidget {
  final List navigationList;

  HomeTopNavigationWidget({Key key, @required this.navigationList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.navigationList.length > 10) {
      this.navigationList.removeRange(10, this.navigationList.length);
    }

    var width = MediaQuery.of(context).size.width;
    return Container(
      height: width / 2.35,
      padding: EdgeInsets.all(10),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 5,
        childAspectRatio: 1,
        children: this.navigationList.map((item) {
          return HomeNavigationItemWidget(
              image: item['image'],
              navigationName: item['mallCategoryName'],
              categoryId: item['mallCategoryId']);
        }).toList(),
      ),
    );
  }
}

/// 首页顶部导航item
class HomeNavigationItemWidget extends StatelessWidget {
  final String categoryId;

  final String image;

  final String navigationName;

  HomeNavigationItemWidget(
      {Key key,
      @required this.image,
      @required this.navigationName,
      @required this.categoryId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        goPage(
            context,
            GoodListPage(
              categoryId: categoryId,
              categorySubId: null,
              goodTitle: navigationName,
            ));
      },
      child: Column(
        children: <Widget>[
          CachedNetworkImage(
            height: ScreenUtil().setHeight(80),
            fit: BoxFit.fill,
            imageUrl: this.image,
            placeholder: (context, url) {
              return Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.fill,
                height: ScreenUtil().setHeight(80),
                width: ScreenUtil().setWidth(80),
              );
            },
            errorWidget: (context, url, error) => Icon(Icons.error),
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
