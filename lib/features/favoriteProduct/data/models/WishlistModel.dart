import 'package:zen_cart_market/features/home/data/models/ProductModel.dart';

class WishlistModel {
  WishlistModel({
    this.status,
    this.count,
    this.data,
  });

  WishlistModel.fromJson(dynamic json) {
    status = json['status'];
    count = json['count'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Product.fromJson(v));
      });
    }
  }
  String? status;
  int? count;
  List<Product>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['count'] = count;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
