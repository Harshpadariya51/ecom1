// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Cart_page extends StatefulWidget {
  const Cart_page({super.key});

  @override
  State<Cart_page> createState() => _Cart_pageState();
}

class _Cart_pageState extends State<Cart_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
        ),
        title: Text(
          "Cart Page",
          style: TextStyle(color: Colors.black, fontSize: 35),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              padding: EdgeInsets.all(10),
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white38,
                    blurStyle: BlurStyle.outer,
                    blurRadius: 4,
                  ),
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Row(
                children: [
                  Image.network(
                    "https://rukminim2.flixcart.com/image/416/416/xif0q/mobile/k/j/n/-original-imags37gyajqxkgp.jpeg?q=70",
                    height: 150,
                  ),
                  Container(
                    color: Colors.white,
                    height: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "iPhone X",
                            style: TextStyle(fontSize: 35),
                          ),
                          Text(
                            "\$ 1000",
                            style: TextStyle(fontSize: 30),
                          ),
                          Spacer(),
                          Text(
                            "DELETE",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.red,
                                fontSize: 30),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              padding: EdgeInsets.all(10),
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Row(
                children: [
                  Image.network(
                    "https://rukminim2.flixcart.com/image/416/416/xif0q/mobile/k/j/n/-original-imags37gyajqxkgp.jpeg?q=70",
                    height: 150,
                  ),
                  Container(
                    height: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "iPhone X",
                            style: TextStyle(fontSize: 35),
                          ),
                          Text(
                            "\$ 1000",
                            style: TextStyle(fontSize: 30),
                          ),
                          Spacer(),
                          Text(
                            "DELETE",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.red,
                                fontSize: 30),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Container(
            alignment: Alignment(-1, 0),
            height: 70,
            width: double.infinity,
            color: Colors.red,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Total Price : ",style: TextStyle(fontSize: 25,color: Colors.white),),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text("\$ 2000.0",style: TextStyle(fontSize: 25,color: Colors.white),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
