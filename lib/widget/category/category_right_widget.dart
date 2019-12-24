import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../provide/CategoryList.dart';

class CategoryRightWidget extends StatelessWidget {
  List list;

  CategoryRightWidget({Key key, @required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provide<CategoryList>(builder: (context, child, val) {
      if (val.currentBxMallSubDto.length == 0) {
        return Container(
          margin: EdgeInsets.all(10),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.grey,
                height: ScreenUtil().setWidth(100),
                width: ScreenUtil().setHeight(100),
                child: Text("${list[0]['bxMallSubDto'][index]['mallSubName']}"),
              );
            },
            itemCount: list[0]['bxMallSubDto'].length,
          ),
        );
      } else {
        return Container(
          margin: EdgeInsets.all(10),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.grey,
                height: ScreenUtil().setWidth(100),
                width: ScreenUtil().setHeight(100),
                child: Text("${val.currentBxMallSubDto[index]['mallSubName']}"),
              );
            },
            itemCount: val.currentBxMallSubDto.length,
          ),
        );
      }
    });
  }
}
