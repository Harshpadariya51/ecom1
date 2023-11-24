// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable
import 'cart_page.dart';
import 'package:flutter/material.dart';

class detail_product extends StatelessWidget {
  String? name;
  String? cat;
  String? img;
  num? price;
  num? rating;

  detail_product(
      {super.key, this.name, this.cat, this.img, this.price, this.rating});

  @override
  Widget build(BuildContext context) {
    Map? data = ModalRoute.of(context)?.settings.arguments as Map?;
    cat = data?["cat"];
    name = data?["name"];
    img = data?["img"];
    price = data?["price"];
    rating = data?["rating"];
    print(data);

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        // elevation: 0,
        backgroundColor: Colors.white70,
        title: Text(
          "Detail Page",
          style: TextStyle(color: Colors.black, fontSize: 35),
        ),
        leading: BackButton(
          color: Colors.black,
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Cart_page();
                  },
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(
                Icons.shopping_cart,
                color: Colors.black,
                size: 25,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 10,
            child: Container(
              child: Image.network(
                "$img",
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(35),
                ),
                boxShadow: [
                  BoxShadow(color: Colors.grey, blurRadius: 4),
                ],
              ),
              child: Container(
                padding:
                    EdgeInsets.only(top: 40, left: 15, right: 15, bottom: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "$name",
                          style: TextStyle(fontSize: 35),
                        ),
                        Spacer(),
                        Text(
                          "\$ $price",
                          style: TextStyle(fontSize: 35, color: Colors.red),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 7),
                      child: Row(
                        children: [
                          Text(
                            "$cat",
                            style: TextStyle(fontSize: 25, color: Colors.grey),
                          ),
                          Spacer(),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Text(
                            "$rating",
                            style: TextStyle(fontSize: 25, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: Row(
                        children: [
                          Text(
                            "Brand",
                            style: TextStyle(fontSize: 35),
                          ),
                          Spacer(),
                          Text(
                            "Apple",
                            style: TextStyle(fontSize: 35, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 17),
                      child: Row(
                        children: [
                          Text(
                            "Stock",
                            style: TextStyle(fontSize: 35),
                          ),
                          Spacer(),
                          Text(
                            "34",
                            style: TextStyle(fontSize: 35, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 30),
                      alignment: Alignment(-1, 0),
                      child: Text(
                        "Description",
                        style: TextStyle(fontSize: 35),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "SIM-Free, Model A 19211 6.5-inch Super Rentina HD display with OLED technology Bionic chip with ...",
                        style: TextStyle(fontSize: 30, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.add_shopping_cart),
      ),
    );
  }
}
