import 'package:flutter/material.dart';
import 'package:rest_app/states/product_state.dart';

class SingleProduct extends StatelessWidget {
  final int id;
  final String title;
  final String image;
  final String regular_price;
  final String sale_price;
  
  SingleProduct({
    Key, key,
    this.id,
    this.title,
    this.image,
    this.regular_price,
    this.sale_price
}):super(key: key);
  
  
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: GestureDetector(
        onTap: (){},
        child: Image.network("http://10.0.2.2:8000$image", fit: BoxFit.cover,),
      ),
      footer: GridTileBar(
        backgroundColor: Colors.white,
        title: Text(title),

      ),
      
    );
  }
}
