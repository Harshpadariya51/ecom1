// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, must_be_immutable, non_constant_identifier_names
import 'package:ecom1/util.dart';
import 'package:flutter/material.dart';
import 'Screen/bill.dart';
import 'Screen/pro_cart.dart';
import 'Screen/pro_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "detailPage": (context) => detail_product(),
        "cartPage": (context) => Cart_Design(),
        "bill": (context) => bill(),
        "/": (context) => Home(),
      },
      color: Colors.green,
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        titleSpacing: 0,
        leadingWidth: 35,
        title: Text(
          "Invoice Generator",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Design....................
            header_design(),
          ],
        ),
      ),
    );
  }
}

class header_design extends StatefulWidget {
  const header_design({super.key});

  @override
  State<header_design> createState() => _header_designState();
}

class _header_designState extends State<header_design> {
  Map clist = Pro_List[0];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Category :......................
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: Pro_List.map((e) {
              String? cat = e["cat_name"];
              String? catData = clist["cat_name"];
              bool selected = cat == catData;
              // print(cat);
              return InkWell(
                onTap: () {
                  clist = e;
                  setState(() {});
                },
                child: Cat_Design(cat_name: cat, selected: selected),
              );
            }).toList(),
          ),
        ),

        // Product Cart..............................
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: (clist["product_list"] as List<Map>).map((e) {
              return Product_Cart(product_map: e);
            }).toList(),
          ),
        ),
        // Product Cart End..................
      ],
    );
  }
}

// Products Design....................................................
class Product_Cart extends StatelessWidget {
  Map? product_map;

  Product_Cart({super.key, this.product_map});

  @override
  Widget build(BuildContext context) {
    // print(product_map?["image"]);
    return InkWell(
      onTap: () {
        // print(product_map?["image"]);
        Navigator.pushNamed(
          context,
          "detailPage",
          arguments: product_map,
        );
      },
      child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 330, left: 20),
              child: Text(
                "Autumn '18",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                height: 370,
                width: 240,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(35)),
                    color: Colors.black12),
                padding: EdgeInsets.only(top: 20),
                // product Info..............
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Like Icon.............
                    Container(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    //  Product Image..............

                    Container(
                      width: 300,
                      height: 204,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'img/${product_map?["image"]}',
                          ), // Replace with your product image
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    // Product Name......
                    Center(
                      child: Text(
                        '${product_map?["name"]}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    // Time & Rate.....
                    Row(
                      children: [
                        // Min
                        Padding(
                          padding: EdgeInsets.only(left: 35),
                          child: Text(
                            '${product_map?["min"]} min',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black38),
                          ),
                        ),
                        Spacer(),
                        // Star
                        Icon(
                          Icons.star_border_outlined,
                          color: Colors.yellow,
                        ),
                        // Rate......
                        Padding(
                          padding: EdgeInsets.only(right: 35),
                          child: Text(
                            '${product_map?["rating"]}',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black38),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    // Product Price - add to cart
                    Row(
                      children: [
                        // Price Of Product
                        Padding(
                          padding: EdgeInsets.only(left: 35, top: 10),
                          child: Text(
                            '\$${product_map?["price"]}',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Category Design.................................................
class Cat_Design extends StatefulWidget {
  String? cat_name;
  bool? selected;

  Cat_Design({super.key, this.cat_name, this.selected});

  @override
  State<Cat_Design> createState() => _Cat_DesignState();
}

class _Cat_DesignState extends State<Cat_Design> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5),
        alignment: Alignment.center,
        height: 40,
        width: 100,
        decoration: BoxDecoration(
          color: (widget.selected ?? true) ? Colors.green : Colors.black12,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          widget.cat_name ?? "",
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: (widget.selected ?? false) ? Colors.black : Colors.green),
        ),
      ),
    );
  }
}
