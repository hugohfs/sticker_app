import 'package:sticker_app/models/OpenFoodFacts/Product.dart';

class OffSearchResult {
  String pageSize;
  List<Product> products;
  String page;
  int skip;
  String count;

  OffSearchResult({this.pageSize, this.products, this.page, this.skip, this.count});

  OffSearchResult.fromJson(Map<String, dynamic> json) {
    pageSize = json['page_size'].toString();
    if (json['products'] != null) {
      products = new List<Product>();
      json['products'].forEach((v) { products.add(new Product.fromJson(v)); });
    }
    page = json['page'].toString();
    skip = json['skip'];
    count = json['count'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page_size'] = this.pageSize;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    data['page'] = this.page;
    data['skip'] = this.skip;
    data['count'] = this.count;
    return data;
  }

  @override
  String toString() {
    return 'OffSearchResult{pageSize: $pageSize, products: $products, page: $page, skip: $skip, count: $count}';
  }


}
