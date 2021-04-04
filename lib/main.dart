import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_app/screens/home_screen.dart';
import 'package:rest_app/states/product_state.dart';


main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => ProductState()),
        // ChangeNotifierProvider(create: (ctx) => UserState()),
        // ChangeNotifierProvider(create: (ctx) => CartState()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Scaffold(
                body: Center(
                  child: Text("Something Went Wrong"),
                ),
              );
            } 
            return HomeScreen();
          },
        ),
      ),
    );
  }
}