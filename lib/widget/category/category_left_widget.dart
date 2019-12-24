import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../provide/CategoryList.dart';

class CategoryLeftListWidget extends StatelessWidget {
  final List list;

  CategoryLeftListWidget({Key key, @required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(160),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Provide.value<CategoryList>(context)
                  .changeSubDto(list[index]['bxMallSubDto']);
            },
            child: Container(
              alignment: Alignment.center,
              height: ScreenUtil().setHeight(100),
              child: Text(
                list[index]['mallCategoryName'],
                style: TextStyle(color: Color(0xff878687)),
              ),
              decoration: BoxDecoration(color: Color(0xfff7f5f7)),
            ),
          );
        },
        itemCount: list.length,
      ),
    );
  }
}
