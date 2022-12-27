import 'package:flutter/material.dart';

class ProductModel extends StatefulWidget {
  const ProductModel({Key? key}) : super(key: key);

  @override
  State<ProductModel> createState() => _ProductModelState();
}

class _ProductModelState extends State<ProductModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:const Text('ProductView With comples json'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Text('hi'),
          ),
        ],
      ),
    );
  }
}
