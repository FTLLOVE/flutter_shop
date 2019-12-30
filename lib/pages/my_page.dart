/**
 * @author: FTL
 * @date: 2019-12-23 13:36
 * @desc: 我的
 */
import 'package:flutter/material.dart';
import '../provide/Counter.dart';
import 'package:provide/provide.dart';
import '../dao/data_base_helper.dart';
import '../dao/data_base_helper.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    var db = DatabaseHelper();
    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
        elevation: 0,
      ),
      body: FutureBuilder(
        future: db.getSum(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data.toString();
            print(data);

            return Center(
              child: Text("${data}"),
            );
          } else {
            return Text("hello");
          }
        },
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
