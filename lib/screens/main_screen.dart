import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http_demo/constants/app_texts.dart';
import 'package:http_demo/data.api/category_api.dart';
import 'package:http_demo/data.api/product_api.dart';
import 'package:http_demo/models/category.dart';
import 'package:http_demo/models/product.dart';
import 'package:http_demo/widgets/product_list_widgets.dart';
import 'package:http_demo/constants/base_colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State {
  List<Category> categories = <Category>[];
  List<Widget> categoryWidgets = <Widget>[];
  List<Product> products = <Product>[];

  AppTexts _appTexts = AppTexts();

  @override
  void initState() {
    getCategoriesFromApi();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _appTexts.appBarText,
          style: const TextStyle(color: BaseColors.white),
        ),
        backgroundColor: BaseColors.blueGrey,
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
        categories = list.map((categories) => Category.fromJson(categories)).toList();
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
        style: const TextStyle(color: BaseColors.blueAccent),
      ),
      style: (TextButton.styleFrom(
        padding: const EdgeInsets.all(9),
        primary: BaseColors.lightGreenAccent,
        backgroundColor: BaseColors.white70,
        side: const BorderSide(color: BaseColors.deepOrange),
      )),
      onPressed: () {
        getProductsByCategoryId(category);
      },
    );
  }

  void getProductsByCategoryId(Category category) {
    ProductApi.getProductsByCategoryId(category.id).then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        products = list.map((product) => Product.fromJson(product)).toList();
      });
    });
  }
}
