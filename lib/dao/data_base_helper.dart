/**
 * @author: FTL
 * @date: 2019-12-29 17:33
 * @desc: 数据库帮助类
 */
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

import '../model/cart_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;
  final String tableName = "table_cart";
  final String columnId = "id";
  final String columnGoodId = "goodId";
  final String columnName = "name";
  final String columnImage = "image";
  final String columnPrice = "price";
  final String columnCount = "count";
  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'sqflite.db');
    var ourDb = await openDatabase(path, version: 2, onCreate: _onCreate);
    return ourDb;
  }

  //创建数据库表
  void _onCreate(Database db, int version) async {
    await db.execute(
        "create table $tableName($columnId integer primary key AUTOINCREMENT, $columnGoodId text not null,$columnName text not null ,$columnImage text not null, $columnPrice real not null, $columnCount integer not null )");
    print("$tableName is created");
  }

  //插入
  Future<int> saveItem(CartModel cartModel) async {
    var dbClient = await db;
    int res = await dbClient.insert("$tableName", cartModel.toMap());
    print(res.toString());
    return res;
  }

  //查询
  Future<List> getTotalList() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableName ");
    return result.toList();
  }

  //查询总数
  Future<int> getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery("SELECT COUNT(*) FROM $tableName"));
  }

  //按照id查询
  Future<CartModel> getItem(String goodId) async {
    var dbClient = await db;
    var result = await dbClient
        .rawQuery("SELECT * FROM $tableName WHERE $columnGoodId = '$goodId'");
    if (result.length == 0) return null;
    return CartModel.fromMap(result.first);
  }

  //清空数据
  Future<int> clear() async {
    var dbClient = await db;
    return await dbClient.delete(tableName);
  }

  //根据id删除
  Future<int> deleteItem(String goodId) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableName, where: "$columnGoodId = ?", whereArgs: [goodId]);
  }

  //修改
  Future<int> updateItem(CartModel cartModel) async {
    var dbClient = await db;
    return await dbClient.update("$tableName", cartModel.toMap(),
        where: "$columnGoodId = ?", whereArgs: [cartModel.goodId]);
  }

  //关闭
  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
