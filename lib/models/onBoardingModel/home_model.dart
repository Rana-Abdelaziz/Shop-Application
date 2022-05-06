import 'dart:convert';

class HomeModel {
  late bool state;
  late HomeDataModel data;
  HomeModel.fromJson(Map<String, dynamic> json) {
    state = json['status'];
    data = HomeDataModel.fromJson(json['data']);
  }
}

class HomeDataModel {
  List<dynamic> banners = [];
  List<dynamic> products = [];
  late int productCount;
  HomeDataModel.fromJson(Map<String, dynamic> json) {
    banners = json['banners'];
    print('${banners.length}');
    products = json['products'];
    productCount = products.length;
    // json['banners'].forEach((element) {
    //   banners.add(element);
    // });
    // json['products'].forEach((element) {
    //   products.add(element);
    // });
  }
}

class BannerModel {
  late int id;
  late String image;
  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}

class ProductModel {
  int? id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? name;
  String? image;
  bool? inFavorite;
  bool? inCart;
  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    oldPrice = json['old_price'];
    price = json['price'];
    discount = json['discount'];
    name = json['name'];
    inFavorite = json['in_favorites'];
    inCart = json['in_cart'];
  }
}
