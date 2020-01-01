/**
 * @author: FTL
 * @date: 2019-12-23 13:38
 * @desc: App入口文件
 */
import 'package:flutter/material.dart';
import 'navigator/tab_navigator.dart';
import 'provide/CategoryList.dart';
import 'package:provide/provide.dart';
import 'constants.dart' show AppColors;

void main() {
  var categoryList = CategoryList();
  var providers = Providers();
  providers..provide(Provider<CategoryList>.value(categoryList));
  runApp(ProviderNode(child: MyApp(), providers: providers));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "百姓生活+",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(AppColors.PrimaryColor)),
      home: TabNavigator(),
    );
  }
}
