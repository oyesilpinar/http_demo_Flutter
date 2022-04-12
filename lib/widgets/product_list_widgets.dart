import 'package:flutter/material.dart';
import 'package:http_demo/widgets/products_list_row.dart';

import '../models/product.dart';

class ProductListWidget extends StatefulWidget{


  List<Product> products=<Product>[];

  ProductListWidget(List<Product> products){
    this.products=products;
  }

  @override
  State<StatefulWidget> createState() {
    return ProductListWidgetState();
  }

}

class ProductListWidgetState extends State<ProductListWidget>{
  @override
  Widget build(BuildContext context) {
    return buildProductsList(context);
  }

  Widget buildProductsList(BuildContext context) {

    return Column(
      children: [
        SizedBox(height: 10),
        SizedBox(
          height:500,
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(widget.products.length,(index){
                return ProductListRowWidget(widget.products[index]);
            }),
          ),
        ),
      ],
    );
    
  }

}