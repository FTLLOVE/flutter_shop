/**
 * @author: FTL
 * @date: 2019/12/19 14:47
 * @desc: 首页广告banner组件
 */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAdvertiseBannerWidget extends StatelessWidget {
  final String picture;

  HomeAdvertiseBannerWidget({Key key, @required this.picture})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.fill,
      imageUrl: this.picture,
      placeholder: (context, url) {
        return Container(
          height: ScreenUtil().setHeight(80),
          color: Colors.grey,
          child: Text("加载中"),
          alignment: Alignment.center,
        );
      },
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
