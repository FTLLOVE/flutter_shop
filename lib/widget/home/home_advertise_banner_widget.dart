/**
 * @author: FTL
 * @date: 2019/12/19 14:47
 * @desc: 首页广告banner组件
 */
import 'package:flutter/material.dart';

class HomeAdvertiseBannerWidget extends StatelessWidget {
  final String picture;

  HomeAdvertiseBannerWidget({Key key, @required this.picture})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(this.picture),
    );
  }
}
