import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoodTopWidget extends StatelessWidget {
  final String image;

  GoodTopWidget({Key key, @required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      fit: BoxFit.fill,
      height: ScreenUtil().setHeight(500),
      width: ScreenUtil().setWidth(750),
      placeholder: (context, url) {
        return Image.asset(
          "assets/images/logo.png",
          fit: BoxFit.fill,
          height: ScreenUtil().setHeight(500),
        );
      },
      errorWidget: (context, url, error) => Container(
        alignment: Alignment.center,
        color: Colors.grey,
        child: Text(
          "无法加载，嘤嘤嘤",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        width: ScreenUtil().setWidth(750),
        height: ScreenUtil().setHeight(500),
      ),
    );
  }
}
