/**
 * @author: FTL
 * @date: 2019/12/19 14:48
 * @desc: 集中请求
 */
import 'package:dio/dio.dart';
import 'dart:async';
import '../config/url.dart';

Future request(url, {formData}) async {
  try {
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = Headers.formUrlEncodedContentType;
    if (formData == null) {
      response = await dio.post(servicePath[url]);
    } else {
      response = await dio.post(servicePath[url], data: formData);
    }
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("后端接口异常");
    }
  } catch (e) {
    print("获取异常: " + e.toString());
  }
}

// 首页火爆专区数据请求
Future getHomePageBelowContent(formData) async {
  return request("homePageBelowContent", formData: formData);
}

// 首页基本数据请求
Future getHomeContent() async {
  var formData = {'lon': '115.02932', 'lat': '35.76189'};
  return request("homeContent", formData: formData);
}
