/**
 * @author: FTL
 * @date: 2019-12-23 13:38
 * @desc: App入口文件
 */
import 'package:flutter/material.dart';
import 'navigator/tab_navigator.dart';
import 'provide/Counter.dart';
import 'provide/CategoryList.dart';
import 'package:provide/provide.dart';

void main() {
  var counter = Counter();
  var categoryList = CategoryList();
  var providers = Providers();
  providers
    ..provide(Provider<Counter>.value(counter))
    ..provide(Provider<CategoryList>.value(categoryList));
  runApp(ProviderNode(child: MyApp(), providers: providers));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "百姓生活+",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0xffdf1581)),
      home: TabNavigator(),
    );
  }
}
