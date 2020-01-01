///
/// @author: FTL
/// @date: 2019-12-31 16:54
/// @desc: 商品列表
///
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/common/spinkit.dart';
import '../service/service_method.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'good_detail_page.dart';
import '../routes/routers.dart';

class GoodListPage extends StatefulWidget {
  final String categoryId;
  final String categorySubId;
  final String goodTitle;

  GoodListPage(
      {Key key,
      @required this.categoryId,
      @required this.categorySubId,
      @required this.goodTitle})
      : super(key: key);

  @override
  _GoodListPageState createState() => _GoodListPageState();
}

class _GoodListPageState extends State<GoodListPage> {
  List categotyList = [];
  int currentPage = 1;

  @override
  void initState() {
    var formData = {
      "categoryId": widget.categoryId,
      "categorySubId": widget.categorySubId,
      "page": 1
    };
    _getMallGoods(formData);
    super.initState();
  }

  _getMallGoods(formData) async {
    await getMallGoods(formData).then((val) {
      var data = json.decode(val.toString());
      if (data['data'] != null) {
        setState(() {
          categotyList.addAll(data['data']);
          currentPage++;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    EasyRefreshController _controller = EasyRefreshController();
    if (categotyList.length == 0) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text(
            "无数据...",
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text("${widget.goodTitle}"),
          centerTitle: true,
        ),
        body: EasyRefresh(
          controller: _controller,
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  goPage(context,
                      GoodDetailPage(goodId: categotyList[index]['goodsId']));
                },
                child: Container(
                  padding:
                      EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
                  child: Row(
                    children: <Widget>[
                      CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl: categotyList[index]['image'],
                        width: ScreenUtil().setWidth(160),
                        height: ScreenUtil().setHeight(160),
                        placeholder: (context, url) {
                          return Image.asset(
                            "assets/images/logo.png",
                            fit: BoxFit.fill,
                            height: ScreenUtil().setHeight(160),
                          );
                        },
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.only(right: 10, top: 10, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              categotyList[index]['goodsName'],
                              maxLines: 2,
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(fontSize: ScreenUtil().setSp(33)),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "￥${categotyList[index]['presentPrice']}",
                                    style: TextStyle(
                                        fontSize: ScreenUtil().setSp(32),
                                        color: Color(0xffdf1581)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 20),
                                    child: Text(
                                      "￥${categotyList[index]['oriPrice']}",
                                      style: TextStyle(
                                          color: Colors.black26,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ))
                    ],
                  ),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.black12))),
                ),
              );
            },
            itemCount: categotyList.length,
          ),
          onLoad: () async {
            var formData = {
              "categoryId": widget.categoryId,
              "categorySubId": widget.categorySubId,
              "page": currentPage
            };
            _getMallGoods(formData);
          },
          footer: ClassicalFooter(
              showInfo: false,
              bgColor: Colors.white,
              loadReadyText: "准备加载",
              loadingText: "加载中",
              loadedText: "无更多数据",
              noMoreText: "无更多数据"),
          firstRefreshWidget: Spinkit(),
        ),
      );
    }
  }
}
