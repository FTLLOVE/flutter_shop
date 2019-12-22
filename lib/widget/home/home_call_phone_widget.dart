import 'package:cached_network_image/cached_network_image.dart';

/**
 * @author: FTL
 * @date: 2019/12/19 21:47
 * @desc: 首页呼叫组件
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeCallPhoneWidget extends StatelessWidget {
  final String avatar;
  final String telephone;

  HomeCallPhoneWidget(
      {Key key, @required this.avatar, @required this.telephone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: CachedNetworkImage(
        fit: BoxFit.fill,
        imageUrl: this.avatar,
        placeholder: (context, url) {
          return Container(
            height: ScreenUtil().setHeight(80),
            color: Colors.grey,
            child: Text("加载中"),
            alignment: Alignment.center,
          );
        },
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
//      child: Image.network(this.avatar),
      onTap: _callPhone,
    );
  }

  _callPhone() async {
    const url = 'https://ftllove.github.io/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
