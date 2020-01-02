# 使用Flutter开发的在线商城

## 效果图

### Android

<img src="https://fantuike.com/d80116d49b744b3093c578383124c0e6.jpg" alt="登录" width="300"/><img src="https://fantuike.com/ffa80ee85ce045bd9d0bbd0db3eafe21.jpg" alt="订单中心" width="300"/>

<img src="https://fantuike.com/0d9d7b7cd0404ad99b25a31b6e0d0c1c.jpg" alt="分类" width="300"/><img src="https://fantuike.com/9e210573d7114cbd826b7d249d3393af.jpg" alt="购物车" width="300"/>

<img src="https://fantuike.com/b25e6faf74c844ef8e1a2f730a13e61d.jpg" alt="关于我" width="300"/><img src="https://fantuike.com/6ac8ac67a1444348acc55bd998955a45.jpg" alt="商品列表" width="300"/>

<img src="https://fantuike.com/83775e98aecb4d09a5c9bacc8578a124.jpg" alt="设置高德" width="300"/><img src="https://fantuike.com/651a0aad36784eb9bf302167919927c4.jpg" alt="首页" width="300"/>

<img src="https://fantuike.com/7ee0f47745d745c68203e96cabd8b256.jpg " alt="首页热门" width="300"/><img src="https://fantuike.com/6072bbd5b591460cb305b85d57cedce8.jpg" alt="首页推荐" width="300"/>

<img src="https://fantuike.com/e643d220f7604411b3e48690a8e6f87c.jpg" alt="首页热门" width="300"/>

### IOS

<img src="https://fantuike.com/6d866495f75a4289b3c8225e84b0bf64.png" alt="首页" width="300"/><img src="https://fantuike.com/f2efaf4ab1b0420dadf7e4d6e0d67e40.png " alt="首页热门" width="300"/>

<img src="https://fantuike.com/1498e2bfd1a945629212e394d470a683.png" alt="首页推荐" width="300"/><img src="https://fantuike.com/56b32e0d18284d339b717de77dc910ef.png" alt="分类" width="300"/>

<img src="https://fantuike.com/419edc501bde4b33a4eb8958a67727eb.png" alt="商品列表" width="300"/><img src="https://fantuike.com/3cce1395daf14fbdabc566ea742ce6c3.png" alt="商品详情" width="300"/>

<img src="https://fantuike.com/38d1c735459e454fa5f24e4ffceef49e.png" alt="订单" width="300"/><img src="https://fantuike.com/4fa4e03e04274d5fa24109ca156f7206.png" alt="购物车" width="300"/>

<img src="https://fantuike.com/9e531ef877d64828b16ccc162e8840c5.png" alt="关于我" width="300"/><img src="https://fantuike.com/d2b5a4a763bf48b7b167c9cb656df5e6.png" alt="我的" width="300"/>
## 说明

> 这个项目是仿百姓生活+的小程序，我从2019.10.20开始做，到2020.1.1结束。相信大家肯定会说这个和技术胖大佬的很像或则一样，但是自己看看代码的话，你会发现有很多不同的地方，这里面包括页面的一些页面的设置还有插件的选择都有所不同。项目是跑在安卓真机上的，IOS是跑在模拟器上的，因为地图在模拟器上看不到效果。等我有空就把开发步骤写下来，做成一个教程。希望大家给我点个star哦~~~

* [x] Android (IOS )

  * [x] 首页
  * [x] 商品分类
  * [x] 购物车
  * [x] 我的
  * [x] 商品列表
  * [x] 商品详情
  * [x] 购物车结算
  * [x] 订单中心
  * [x] 上拉加载/下拉刷新
  * [x] 地图定位/搜索
  * [x] 关于我(webview)
  * [x] 登录
  * [ ] 购物车的全选
  * [ ] 个人头像的上传
  * [ ] 下订单
  * [ ] 地址管理
  * [ ] 联系客服

## 使用的插件

```
  flutter_swiper: ^1.1.6 // 轮播图
  dio: ^3.0.7 // 网络请求
  flutter_screenutil: ^0.7.0 // 屏幕适配
  url_launcher: ^5.4.1 // 通讯
  flutter_spinkit: "^4.1.1" // 加载
  fluwx: ^1.1.4 // 微信
  flutter_easyrefresh: ^2.0.8 // 下拉刷新，上拉加载
  image_picker: ^0.6.2+3 // 照片拾取
  camera: ^0.5.7+2 // 拍照
  provide: ^1.0.2 // 状态管理
  flutter_html: ^0.11.1 // html
  cached_network_image: ^2.0.0-rc // 缓存图片
  flutter_staggered_grid_view: "^0.2.7" // 瀑布流
  toast: ^0.1.4 // toast
  sqflite: ^1.2.0 // 内容存储
  shared_preferences: ^0.5.6 // 内容存储
  flutter_custom_dialog: ^1.0.14 // dialog
  flutter_webview_plugin: ^0.3.10+1 // webview
  amap_map_fluttify: ^0.17.4+59a3abb // 地图
  permission_handler: '^4.0.0' // 权限请求
  decorated_flutter: ^0.10.0 // 绘制地图
  amap_search_fluttify: ^0.7.2+4d92ce0 // 地图搜索
```

### 

