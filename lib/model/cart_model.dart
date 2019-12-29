/**
 * @author: FTL
 * @date: 2019-12-29 17:44
 * @desc: 购物车model
 */
class CartModel {
  int count;
  double price;
  String image;
  String name;
  String goodId;
  int id;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map['count'] = count;
    map['price'] = price;
    map['image'] = image;
    map['name'] = name;
    map['goodId'] = goodId;
    map['id'] = id;
    return map;
  }

  static CartModel fromMap(Map<String, dynamic> map) {
    CartModel user = new CartModel();
    user.count = map['count'];
    user.price = map['price'];
    user.image = map['image'];
    user.name = map['name'];
    user.goodId = map['goodId'];
    user.id = map['id'];
    return user;
  }

  static List<CartModel> fromMapList(dynamic mapList) {
    List<CartModel> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}
