import 'package:flutter/material.dart';
import 'package:rest_api/Pages/complex_json_with_product_model.dart';

import 'Pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Rest Api',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:const  ProductModel(),
    );
  }
}

