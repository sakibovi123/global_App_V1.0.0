class ProductModel {
  int id;
  String title;
  String image;
  bool relatedProduct;
  int regularPrice;
  int salePrice;
  Category category;
  Category brand;
  Null camp;

  ProductModel(
      {this.id,
        this.title,
        this.image,
        this.relatedProduct,
        this.regularPrice,
        this.salePrice,
        this.category,
        this.brand,
        this.camp});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    relatedProduct = json['related_product'];
    regularPrice = json['regular_price'];
    salePrice = json['sale_price'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    brand = json['brand'] != null ? new Category.fromJson(json['brand']) : null;
    camp = json['camp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['related_product'] = this.relatedProduct;
    data['regular_price'] = this.regularPrice;
    data['sale_price'] = this.salePrice;
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    if (this.brand != null) {
      data['brand'] = this.brand.toJson();
    }
    data['camp'] = this.camp;
    return data;
  }
}

class Category {
  int id;
  String title;
  String image;

  Category({this.id, this.title, this.image});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    return data;
  }
}