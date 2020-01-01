///
/// @author: FTL
/// @date: 2020-01-01 16:04
/// @desc: 高德地图
///
import 'package:flutter/material.dart';
import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:flutter_app/constants.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:amap_search_fluttify/amap_search_fluttify.dart';
import 'package:toast/toast.dart';
import '../widget/common/spinkit.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  AmapController _controller;
  List<Poi> poiList;
  static List<PoiModel> list = new List();
  static List<PoiModel> searchList = new List();
  PoiModel poiModel;
  String keyword = "";
  String address = "";
  bool isLoading = true;
  String currentAddress = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false, //防止底部被顶起
      appBar: AppBar(
        title: Text(
          "高德地图",
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Theme(
              data: ThemeData(
                  primaryColor: Color(AppColors.PrimaryColor),
                  hintColor: Color(AppColors.PrimaryColor)),
              child: Container(
                color: Color(AppColors.PrimaryColor),
                padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                child: TextField(
                  style: TextStyle(fontSize: 16, letterSpacing: 1),
                  controller: TextEditingController.fromValue(TextEditingValue(
                      text: keyword,
                      selection: TextSelection.fromPosition(
                          TextPosition(offset: keyword?.length ?? 0)))),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      hintText: "请输入关键字",
                      hintStyle:
                          TextStyle(color: Color(0xFFBEBEBE), fontSize: 14),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 1),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: 20,
                      ),
                      suffixIcon: IconButton(
                          icon: Icon(
                            Icons.clear,
                            color: Colors.grey,
                            size: 20,
                          ),
                          onPressed: () {
                            keyword = "";
                            setState(() {});
                          }),
                      fillColor: Colors.white,
                      filled: true),
                  inputFormatters: [],
                  onChanged: (text) {
                    keyword = text;
                  },
                  onSubmitted: (text) {
                    keyword = text;
                    setState(() {
                      isLoading = true;
                      FocusScope.of(context).requestFocus(FocusNode());
                      searchAroundAddress(text.toString());
                    });
                  },
                  onEditingComplete: () {
                  },
                ),
              )),
          Container(
            height: 300,
            child: Stack(
              children: <Widget>[
                AmapView(
                  showZoomControl: false,
                  maskDelay: Duration(milliseconds: 500),
                  zoomLevel: 16,
                  onMapCreated: (controller) async {
                    _controller = controller;
                    if (await requestPermission(context)) {
                      await controller.showMyLocation(true);
                      await controller?.showLocateControl(true);
                      final latLng = await _controller?.getLocation(
                          timeout: Duration(seconds: 2));
                      await enableFluttifyLog(false);
                      _loadData(latLng);
                    }
                  },
                  onMapMoveEnd: (MapMove move) {
                    _loadData(move.latLng);
                  },
                ),
                Center(
                  child: Icon(
                    Icons.place,
                    size: 36,
                    color: Color(0xFFFF0000),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Visibility(
              visible: !isLoading,
              maintainSize: false,
              maintainSemantics: false,
              maintainInteractivity: false,
              replacement: Spinkit(),
              child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int position) {
                    PoiModel item = list[position];
                    return InkWell(
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin:
                                EdgeInsets.only(top: 8, bottom: 5, left: 10),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.place,
                                  size: 20.0,
                                  color: position == 0
                                      ? Colors.green
                                      : Colors.grey,
                                ),
                                Text(item.title,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: position == 0
                                            ? Colors.green
                                            : Color(0xFF787878)))
                              ],
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: 5, bottom: 5, left: 18),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              item.address,
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF646464),
                              ),
                            ),
                          ),
                          Divider(
                            height: 1,
                          )
                        ],
                      ),
                      onTap: () async {
                        await _controller.setCenterCoordinate(
                            item.latLng.latitude, item.latLng.longitude,
                            zoomLevel: 16);
//                        Navigator.pop(context, {'address': item.address});
                      },
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }

  Future<bool> requestPermission(BuildContext context) async {
    final permissions = await PermissionHandler()
        .requestPermissions([PermissionGroup.location]);
    if (permissions[PermissionGroup.location] == PermissionStatus.granted) {
      return true;
    } else {
      Toast.show("需要地图定位", context);
      return false;
    }
  }

  void _loadData(LatLng latLng) async {
    setState(() {
      isLoading = true;
    });
    ReGeocode reGeocodeList = await AmapSearch.searchReGeocode(latLng);
    await reGeocodeList.aoiList.then((val) {
      print(val);
    });
//    await reGeocodeList.toFutureString().then((val) {
//      print(val);
//    });
    address = await reGeocodeList.formatAddress;
    final poiList =
        await AmapSearch.searchKeyword(address.toString(), city: "南京");
    poiModel = PoiModel("当前位置", address, latLng);
    list.clear();
    list.add(poiModel);
    for (var poi in poiList) {
      String title = await poi.title;
      String cityName = await poi.cityName;
      String provinceName = await poi.provinceName;
      String address = await poi.address;
      LatLng latLng = await poi.latLng;

      list.add(new PoiModel(
          title.toString(),
          provinceName.toString() + cityName.toString() + address.toString(),
          latLng));
    }

    setState(() {
      isLoading = false;
    });
  }

  void searchAroundAddress(String text) async {
    final poiList = await AmapSearch.searchKeyword(
      text,
      city: "西安",
    );

    list.clear();
    list.add(poiModel);
    for (var poi in poiList) {
      String title = await poi.title;
      LatLng latLng = await poi.latLng;
      String cityName = await poi.cityName;
      String provinceName = await poi.provinceName;
      String address = await poi.address;
      list.add(new PoiModel(
          title.toString(),
          provinceName.toString() + cityName.toString() + address.toString(),
          latLng));
    }
    setState(() {
      isLoading = false;
      FocusScope.of(context).requestFocus(FocusNode());
    });
  }
}

class PoiModel {
  LatLng latLng;
  String title;
  String address;

  PoiModel(this.title, this.address, this.latLng);
}
