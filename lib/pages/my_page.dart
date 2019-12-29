/**
 * @author: FTL
 * @date: 2019-12-23 13:36
 * @desc: 我的
 */
import 'package:flutter/material.dart';
import '../provide/Counter.dart';
import 'package:provide/provide.dart';
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
      body: Center(
        child: Provide<Counter>(builder: (context, child, val) {
          return Column(
            children: <Widget>[
              Text(
                "${val.value}",
                style: TextStyle(fontSize: 30),
              ),
              RaisedButton(
                onPressed: () {
                  db.getTotalList().then((val) {
                    print(val);
                  });
                },
                child: Text("查看"),
              )
            ],
          );
        }),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
