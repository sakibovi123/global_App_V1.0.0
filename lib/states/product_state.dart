import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:rest_app/models/product_model.dart';

class ProductState with ChangeNotifier{
  List<ProductModel> _products = [];

  Future<bool> getProducts() async {
    var url = Uri.parse("http://10.0.2.2:8000/api/products/");

    try{
      http.Response res = await http.get(url);

      var data = json.decode(res.body) as List;

      List<ProductModel> temp = [];

      data.forEach((element) {
        ProductModel products = ProductModel.fromJson(element);
        temp.add(products);
      });

    _products = temp;
    notifyListeners();

    return true;
    }

    catch(e) {
      throw "e getProducts";
      return false;
    }
  }


  List<ProductModel> get products {
    return [..._products];
  }

  ProductModel singleProduct(int id) {
    return _products.firstWhere((element) => element.id == id);
  }

}