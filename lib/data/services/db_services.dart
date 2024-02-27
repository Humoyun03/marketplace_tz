

import 'package:marketplace_tz/data/models/catalog_item_model.dart';
import 'package:marketplace_tz/data/models/catalog_item_model.dart';
import 'package:marketplace_tz/data/models/catalog_item_model.dart';
import 'package:marketplace_tz/data/models/catalog_item_model.dart';
import 'package:marketplace_tz/data/models/catalog_item_model.dart';
import 'package:marketplace_tz/data/models/category_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/product_model.dart';


class SqliteService {
  List<CategoryModel> categories = [
    CategoryModel(
        image: 'assets/images/item1.png',
        name: "Ichimliklar",
        ),
    CategoryModel(
        image: 'assets/images/item2.png',
        name: "Mevalar",
        ),
    CategoryModel(
        image: 'assets/images/item3.png',
        name: "Sut va qatiq",
        ),
    CategoryModel(
        image: 'assets/images/item4.png',
        name: "Qahvalar",
        ),
    CategoryModel(
        image: 'assets/images/item1.png',
        name: "Ichimliklar",
       ),

  ];
  List<CatalogItemModel> catalogItems = [
    CatalogItemModel(
      image: 'assets/images/limonad.png',
      name: "Limonadlar",
    ),
    CatalogItemModel(
      image: 'assets/images/choylar.png',
      name: "Choylar",
    ),
    CatalogItemModel(
      image: 'assets/images/sharbatlar.png',
      name: "Sharbatlar",
    ),
    CatalogItemModel(
      image: 'assets/images/energetik.png',
      name: "Energetik ichimliklar",
    ),
    CatalogItemModel(
      image: 'assets/images/mahalliy.png',
      name: "Mahalliy ichimliklar",
    ),
    CatalogItemModel(
      image: 'assets/images/chet.png',
      name: "Chet el ichimliklari",
    ),

  ];
  List<ProductModel> products = [
    ProductModel(
        name: "Lactel Sutim 1%",
        image:'assets/images/bottle.png',
        capacity: "1.5",
        price: 400
    ),

    ProductModel(
      name: "Coca-Cola",
        image:'assets/images/cola.png',
        capacity: "1.5",
        price: 400
        ),
    ProductModel(
      name: "Lactel Sutim 1%",
        image:'assets/images/bottle.png',
        capacity: "1.5",
        price: 400
        ),
    ProductModel(
      name: "Coca-Cola",
        image:'assets/images/cola.png',
        capacity: "1.5",
        price: 400
        ),
    ProductModel(
      name: "Lactel Sutim 1%",
        image:'assets/images/bottle.png',
        capacity: "1.5",
        price: 400
        ),

  ];

  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();

    return openDatabase(
      join(path, 'database.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE Enter(enter INTEGER NOT NULL)",
        );
        await database.execute(
          "CREATE TABLE Enter1(enter INTEGER NOT NULL)",
        );
        await database.execute(
          "CREATE TABLE Category(image TEXT NOT NULL, name TEXT NOT NULL)",
        );
        await database.execute(
          "CREATE TABLE CatalogItem(image TEXT NOT NULL, name TEXT NOT NULL)",
        );
        await database.execute(
          "CREATE TABLE Product(name TEXT NOT NULL, image TEXT NOT NULL,capacity TEXT NOT NULL,price INTEGER NOT NULL)",
        );
      },
      version: 2,
    );
  }

  Future createEnter() async {
    final Database db = await initializeDB();
    await db.insert('Enter', {"enter":0});
  }
  Future createEnter1() async {
    final Database db = await initializeDB();
    await db.insert('Enter1', {"enter":0});
  }


  Future createItem() async {
    final Database db = await initializeDB();
    for(CategoryModel category in categories){
      print(category);
      await db.insert('Category', category.toMap());
    }
  }
  Future createCatalogItem() async {
    final Database db = await initializeDB();
    for(CatalogItemModel catalogItem in catalogItems){
      print(catalogItem);
      await db.insert('CatalogItem', catalogItem.toMap());
    }
  }

  Future createProduct() async {
    final Database db = await initializeDB();
    for(ProductModel cashier in products){
      print(cashier);
      await db.insert('Product', cashier.toMap());
    }
  }


  Future<List<Map<String,dynamic>>> getEnter() async {
    final db = await initializeDB();
    final List<Map<String, dynamic>> queryResult = await db.query('Enter');
    return queryResult;
  }

  Future<List<Map<String,dynamic>>> getEnter1() async {
    final db = await initializeDB();
    final List<Map<String, dynamic>> queryResult = await db.query('Enter1');
    return queryResult;
  }

  Future<List<CategoryModel>> getItems() async {
    final db = await initializeDB();
    final List<Map<String, dynamic>> queryResult = await db.query('Category');
    return queryResult.map((e) => CategoryModel.fromMap(e)).toList();
  }
  Future<List<CatalogItemModel>> getCatalogItems() async {
    final db = await initializeDB();
    final List<Map<String, dynamic>> queryResult = await db.query('CatalogItem');
    return queryResult.map((e) => CatalogItemModel.fromMap(e)).toList();
  }

  Future<List<ProductModel>> getProduct() async {
    final db = await initializeDB();
    final List<Map<String, dynamic>> queryResult = await db.query('Product');
    return queryResult.map((e) => ProductModel.fromMap(e)).toList();
  }

}

