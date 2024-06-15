class ProductModel {
  int? status;
  List<Products>? products;
  String? message;

  ProductModel({this.status, this.products, this.message});

  ProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class Products {
  String? nama;
  String? category;
  String? quantity;
  int? price;
  String? productImage;
  int? sellerId;

  Products(
      {this.nama,
      this.category,
      this.quantity,
      this.price,
      this.productImage,
      this.sellerId});

  Products.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    category = json['category'];
    quantity = json['quantity'];
    price = json['price'];
    productImage = json['product_image'];
    sellerId = json['seller_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama'] = nama;
    data['category'] = category;
    data['quantity'] = quantity;
    data['price'] = price;
    data['product_image'] = productImage;
    data['seller_id'] = sellerId;
    return data;
  }
}
