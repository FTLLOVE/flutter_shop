/**
 * @author: FTL
 * @date: 2019/12/19 21:47
 * @desc: 首页楼层组件
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeFloorWidget extends StatelessWidget {
  final String floorTitlePic;

  final List floorPicList;

  HomeFloorWidget(
      {Key key, @required this.floorTitlePic, @required this.floorPicList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _floorTitlePicWidget(floorTitlePic),
        _floorPicListWidget(floorPicList)
      ],
    );
  }

  Widget _floorTitlePicWidget(String floorTitlePic) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Image.network(
        floorTitlePic,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _floorPicListWidget(List floorPicList) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              _floorItemWidget(floorPicList[0]),
              Column(
                children: <Widget>[
                  _floorItemWidget(floorPicList[1]),
                  _floorItemWidget(floorPicList[2]),
                ],
              )
            ],
          ),
          Row(
            children: <Widget>[
              _floorItemWidget(floorPicList[3]),
              _floorItemWidget(floorPicList[4]),
            ],
          )
        ],
      ),
    );
  }

  Widget _floorItemWidget(Map item) {
    return Container(
      width: ScreenUtil().setWidth(375),
      child: InkWell(
        onTap: () {
          print("hello");
        },
        child: Image.network(item['image']),
      ),
    );
  }
}
