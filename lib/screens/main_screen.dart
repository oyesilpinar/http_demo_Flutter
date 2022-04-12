import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http_demo/data.api/category_api.dart';
import 'package:http_demo/data.api/product_api.dart';
import 'package:http_demo/models/category.dart';
import 'package:http_demo/models/product.dart';
import 'package:http_demo/widgets/product_list_widgets.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State {
  List<Category> categories = <Category>[];
  List<Widget> categoryWidgets = <Widget>[];
  List<Product> products =<Product>[];

  @override
  void initState() {
    getCategoriesFromApi();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Alışveriş Sistemi",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categoryWidgets,
              ),
            ),
            ProductListWidget(products)
          ],
        ),
      ),
    );
  }

  void getCategoriesFromApi() {
    CategoryApi.getCategories().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        this.categories =
            list.map((categories) => Category.fromJson(categories)).toList();
        getCategoryWidgets();
      });
    });
  }

  List<Widget> getCategoryWidgets() {
    for (int i = 0; i < categories.length; i++) {
      categoryWidgets.add(getCategoryWidget(categories[i]));
    }
    return categoryWidgets;
  }

  Widget getCategoryWidget(Category category) {
    return TextButton(
      child: Text(
        category.categoryName,
        style: TextStyle(color: Colors.blueAccent),
      ),
      style: (TextButton.styleFrom(
        padding: const EdgeInsets.all(9),
        primary: Colors.lightGreenAccent,
        backgroundColor: Colors.white70,
        side: const BorderSide(color: Colors.deepOrange),
      )),
      onPressed: () {
        getProductsByCategoryId(category);
      },
    );
  }

  void getProductsByCategoryId(Category category) {
    ProductApi.getProductsByCategoryId(category.id).then((response){
      setState(() {
        Iterable list = json.decode(response.body);
        this.products = list.map((product) => Product.fromJson(product)).toList();
      });
    });
  }


}
