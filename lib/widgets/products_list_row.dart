import 'package:flutter/material.dart';
import 'package:http_demo/models/product.dart';

class ProductListRowWidget extends StatelessWidget{

  Product product;

  ProductListRowWidget(this.product);

  @override
  Widget build(BuildContext context) {
    
    return buildProductItemCard(context);
  }

  Widget buildProductItemCard(BuildContext context) {

    return InkWell(
      child: Card(
        child:Column(
          children: <Widget>[
            Container(
              child: Image.network("https://cdn.pixabay.com/user/2014/05/07/00-10-34-2_250x250.jpg"),
              height: 130,
              width: MediaQuery.of(context).size.width/2,
            ),
            Text(product.productName),
            Text(product.unitPrice.toString()+" TL",style: TextStyle(fontSize:15, color: Colors.deepPurpleAccent ),),
          ],
        )
      ),
    );
  }


  
}