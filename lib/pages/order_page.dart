///
/// @author: FTL
/// @date: 2019-12-31 16:56
/// @desc: 订单页面
///
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderPage extends StatefulWidget {
  int currentIndex = 1;

  OrderPage({Key key, this.currentIndex}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage>
    with SingleTickerProviderStateMixin {
  final List<Tab> _titleList = [
    Tab(
      text: "全部",
    ),
    Tab(
      text: "待付款",
    ),
    Tab(
      text: "待发货",
    ),
    Tab(
      text: "待收货",
    ),
    Tab(
      text: "待评价",
    )
  ];
  TabController _controller;

  @override
  void initState() {
    _controller = TabController(
        length: _titleList.length,
        vsync: this,
        initialIndex: widget.currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _titleList.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text("订单中心"),
            centerTitle: true,
            bottom: TabBar(
              tabs: _titleList.toList(),
              indicatorColor: Colors.white,
              controller: _controller,
            ),
          ),
          body: TabBarView(
              controller: _controller,
              children: _titleList.map((item) {
                return Center(
                  child: Text(
                    "空空如也...",
                    style: TextStyle(fontSize: ScreenUtil().setSp(30)),
                  ),
                );
              }).toList()),
        ));
  }
}
