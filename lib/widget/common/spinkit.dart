/**
 * @author: FTL
 * @date: 2019-12-23 13:36
 * @desc: 全局加载loading组件
 */
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Spinkit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpinKitCircle(
      color: Color(0xffdf1581),
      size: 40,
    );
  }
}
