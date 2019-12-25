import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../provide/CategoryList.dart';
import '../../pages/good_list_page.dart';

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
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GoodListPage(
                                categoryId: list[0]['bxMallSubDto'][index]
                                    ['mallCategoryId'],
                                categorySubId: list[0]['bxMallSubDto'][index]
                                    ['mallSubId'],
                                goodTitle: list[0]['bxMallSubDto'][index]
                                    ['mallSubName'],
                              )));
                },
                child: Stack(
                  alignment: FractionalOffset(0.5, 0.5),
                  children: <Widget>[
                    Image.asset(
                      "assets/images/logo.png",
                      fit: BoxFit.fill,
                      height: 80,
                      width: 80,
                    ),
                    Text(
                      "${list[0]['bxMallSubDto'][index]['mallSubName']}",
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                ),
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
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GoodListPage(
                                categoryId: val.currentBxMallSubDto[index]
                                    ['mallCategoryId'],
                                categorySubId: val.currentBxMallSubDto[index]
                                    ['mallSubId'],
                                goodTitle: val.currentBxMallSubDto[index]
                                    ['mallSubName'],
                              )));
                },
                child: Stack(
                  alignment: FractionalOffset(0.5, 0.5),
                  children: <Widget>[
                    Image.asset(
                      "assets/images/logo.png",
                      fit: BoxFit.fill,
                      height: 80,
                      width: 80,
                    ),
                    Text(
                      "${val.currentBxMallSubDto[index]['mallSubName']}",
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                ),
              );
            },
            itemCount: val.currentBxMallSubDto.length,
          ),
        );
      }
    });
  }
}
