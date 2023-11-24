// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, must_be_immutable, avoid_print, non_constant_identifier_names, prefer_const_constructors_in_immutables, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';

import '../util.dart';

class Cart_Design extends StatefulWidget {
  Cart_Design({super.key});

  @override
  State<Cart_Design> createState() => _Cart_DesignState();
}

class _Cart_DesignState extends State<Cart_Design> {
  void finaltotal() {
    Global.finalsum = 0;
    if (Global.Cart_List.isEmpty) {
      Global.finalsum = 0;
    } else {
      Global.Cart_List.forEach((val) {
        Global.finalsum = Global.finalsum + (val["price"] * val["qty"]);
        setState(() {});
      });
      Global.finalsum = Global.finalsum + Global.delivery - Global.discount;
    }
    setState(() {});
  }

  void subtotal() {
    Global.subsum = 0;
    Global.Cart_List.forEach((val) {
      Global.subsum = Global.subsum + (val["price"] * val["qty"]);
    });
    Global.discount = (5 * Global.subsum) / 100;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    subtotal();
    finaltotal();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed('detailPage');
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Cart",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/');
              },
              icon: Icon(Icons.close))
        ],
      ),
      body: Container(
        alignment: Alignment(0, 1),
        height: double.infinity,
        width: double.infinity,
        child: Container(
          height: 600,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(35),
              ),
              color: Colors.white),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ...Global.Cart_List.map((e) {
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      padding: EdgeInsets.only(left: 7),
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: Colors.black12,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Image
                                Container(
                                  height: 100,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(45),
                                  ),
                                  child: CircleAvatar(
                                    foregroundImage:
                                        AssetImage('img/${e['image']}'),
                                  ),
                                ),
                                // Name, Price Per Product........
                                Container(
                                  height: 100,
                                  width: 70,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: 2, left: 3),
                                          child: Text(
                                            "${e['name']}",
                                            style: TextStyle(
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 2, right: 2),
                                          child: Text(
                                            "\$${e['price']}",
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                  ),
                                ),
                                // Qty , Per Product Qty Total.........
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              if (e['qty']! > 1) {
                                                e['qty']--;
                                                subtotal();
                                                finaltotal();
                                                setState(() {});
                                              }
                                            },
                                            child: Container(
                                              margin: EdgeInsets.all(10),
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                                color: Colors.black,
                                              ),
                                              child: Icon(
                                                (e['qty'] > 1)
                                                    ? Icons.remove
                                                    : Icons.block_flipped,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Text(
                                              "${e['qty']}",
                                              style: TextStyle(
                                                fontSize: 25,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              if (e['qty']! < 10) {
                                                e['qty']++;
                                                subtotal();
                                                finaltotal();
                                                setState(() {});
                                              }
                                            },
                                            child: Container(
                                              margin: EdgeInsets.all(10),
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                                color: Colors.black,
                                              ),
                                              child: Icon(
                                                (e['qty'] < 10)
                                                    ? Icons.add
                                                    : Icons.block_flipped,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Text(
                                        "\$${e['subTotal'] = e['price'] * e['qty']}",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: IconButton(
                                      onPressed: () {
                                        Global.Cart_List.remove(e);
                                        subtotal();
                                        finaltotal();
                                        setState(() {});
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        size: 40,
                                      )),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    padding: EdgeInsets.only(left: 7),
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Colors.black12,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.discount,
                            color: Colors.black38,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Promo Code",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black38),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment(0, 0),
                            height: 60,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                              color: Colors.green,
                            ),
                            child: Text(
                              "Apply",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 290,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: Colors.black12,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                "SubTotal",
                                style: TextStyle(fontSize: 20),
                              ),
                              Spacer(),
                              Text(
                                "\$${Global.subsum}",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 2,
                          color: Colors.black12,
                          width: double.infinity,
                        ),
                        // Delivery Charge .......................
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                "Delivery",
                                style: TextStyle(fontSize: 20),
                              ),
                              Spacer(),
                              Text(
                                (Global.Cart_List.isNotEmpty)
                                    ? "\$${Global.delivery}"
                                    : "\$0",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 2,
                          color: Colors.black12,
                          width: double.infinity,
                        ),
                        // discount ..........................
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                "Discount",
                                style: TextStyle(fontSize: 20),
                              ),
                              Spacer(),
                              Text(
                                "- \$${Global.discount}",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 2,
                          color: Colors.black12,
                          width: double.infinity,
                        ),
                        // Final Total..........................
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                "Total",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Text(
                                "\$${Global.finalsum}",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('bill');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              alignment: Alignment(0, 0),
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: Text(
                                "CHECKOUT",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
