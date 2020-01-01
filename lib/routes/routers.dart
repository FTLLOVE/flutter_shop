import 'package:flutter/material.dart';

///
/// 跳转到指定页面
///
void goPage(BuildContext context, Widget pageName) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => pageName));
}

///
/// 跳转到指定页面不可返回
///
void goPageAndRemoveUntil(BuildContext context, Widget pageName) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => pageName),
      (route) => route == null);
}
