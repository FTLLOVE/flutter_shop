/**
 * @author: FTL
 * @date: 2019-12-23 13:36
 * @desc: 我的
 */
import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
        elevation: 0,
      ),
      body: Center(
        child: Text("我的"),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
