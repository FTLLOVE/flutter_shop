///
/// @author: FTL
/// @date: 2019-12-31 16:55
/// @desc: 分类
///
import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'dart:convert';
import '../widget/category/category_left_widget.dart';
import '../widget/category/category_right_widget.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List categoryList = [];

  @override
  void initState() {
    this._getCategoryList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _getCategoryList();
    return Scaffold(
      appBar: AppBar(
        title: Text("分类"),
        elevation: 0,
        centerTitle: true,

      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CategoryLeftListWidget(
            list: categoryList,
          ),
          Expanded(
            child: CategoryRightWidget(list: categoryList),
          )
        ],
      ),
    );
  }

  void _getCategoryList() async {
    await getCategoryList().then((val) {
      var data = json.decode(val.toString());
      List<Map> list = (data['data'] as List).cast();
      setState(() {
        categoryList = list;
      });
    });
  }
}
