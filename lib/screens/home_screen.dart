import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_app/states/product_state.dart';
import 'package:rest_app/widgets/single_product_screen.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _init = true;
  bool _isLoading = false;

  @override
  void didChangeDependencies() async {
    if (_init){
      _isLoading = await Provider.of<ProductState>(context).getProducts();

      setState(() {});
    }

    _init = false;

    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductState>(context).products;
    if(!_isLoading){
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator()
        ),
      );
    }
    else{
      return Scaffold(
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 3 / 2,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
            itemCount: product.length,
          itemBuilder: (ctx, i) => SingleProduct(
            id: product[i].id,
            title: product[i].title,
            image: product[i].image,

          ),
        ),
      );
    }

  }
}

    
    
    