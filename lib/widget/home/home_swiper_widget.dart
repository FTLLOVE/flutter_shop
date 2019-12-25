/**
 * @author: FTL
 * @date: 2019/12/19 14:49
 * @desc: 首页轮播组件
 */
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeSwiperWidget extends StatelessWidget {
  List swiperList;

  HomeSwiperWidget({Key key, @required this.swiperList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemCount: this.swiperList.length,
        itemBuilder: (BuildContext context, int index) {
          return CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: "${swiperList[index]['image']}",
            placeholder: (context, url) {
              return Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.fill,
                height: ScreenUtil().setHeight(333),
                width: ScreenUtil().setWidth(750),
              );
            },
            errorWidget: (context, url, error) => Icon(Icons.error),
          );
        },
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}
