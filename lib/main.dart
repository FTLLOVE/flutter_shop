import 'package:flutter/material.dart';
import 'navigator/tab_navigator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "百姓生活+",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0xffdf1581)),
      home: TabNavigator(
      ),
    );
  }

}

// StatelessWidget(无状态组件) && StatefulWidget(有状态组件)
