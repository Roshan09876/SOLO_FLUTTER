import 'package:flutter/material.dart';
import 'package:online_mobile/widget/FLoatingbutton/cart_model.dart';
import 'package:online_mobile/widget/FLoatingbutton/cart_provider.dart';
import 'package:online_mobile/widget/FLoatingbutton/db_helper.dart';
import 'package:provider/provider.dart';

import '../../services/notification_service.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key, required id});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  DBHelper? dbHelper = DBHelper();
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff123456),
        title: Text(
          "Cart",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Column(children: [
        FutureBuilder(
            future: cart.getData(),
            builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, left: 8, right: 8),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(12),
                                      bottomRight: Radius.circular(12))),
                              shadowColor: Colors.red,
                              child: Column(children: [
                                Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image(
                                        height: 130,
                                        width: 200,
                                        image: NetworkImage(
                                          snapshot.data![index].image
                                              .toString(),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                snapshot
                                                    .data![index].productName
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              InkWell(
                                                onTap: (() {
                                                  dbHelper!.delete(snapshot
                                                      .data![index].id!);
                                                  cart.romoverCounter();
                                                  cart.removeTotalPrice(
                                                      double.parse(snapshot
                                                          .data![index]
                                                          .productPrice
                                                          .toString()));
                                                }),
                                                child: Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                ),
                                              )
                                            ],
                                          ),
                                          Text(
                                            snapshot.data![index].unitTag
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue,
                                                fontSize: 16),
                                          ),
                                          Text(
                                            "\Rs. " +
                                                snapshot
                                                    .data![index].productPrice
                                                    .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red,
                                                fontSize: 16),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 80,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                    onTap: () {
                                                      int quantity = snapshot
                                                          .data![index]
                                                          .quantity!;
                                                      int price = snapshot
                                                          .data![index]
                                                          .initialPrice!;
                                                      quantity--;
                                                      int? newPrice =
                                                          price * quantity;

                                                      if (quantity > 0) {
                                                        dbHelper!
                                                            .deleteQuantity(Cart(
                                                                id: snapshot
                                                                    .data![
                                                                        index]
                                                                    .id,
                                                                productId: snapshot
                                                                    .data![
                                                                        index]
                                                                    .id!
                                                                    .toString(),
                                                                productName: snapshot
                                                                    .data![
                                                                        index]
                                                                    .productName,
                                                                initialPrice: snapshot
                                                                    .data![
                                                                        index]
                                                                    .initialPrice,
                                                                productPrice:
                                                                    newPrice,
                                                                quantity:
                                                                    quantity,
                                                                unitTag: snapshot
                                                                    .data![
                                                                        index]
                                                                    .unitTag
                                                                    .toString(),
                                                                image: snapshot
                                                                    .data![
                                                                        index]
                                                                    .image
                                                                    .toString()))
                                                            .then((value) {
                                                          newPrice = 0;
                                                          quantity = 0;
                                                          cart.removeTotalPrice(
                                                              double.parse(
                                                            snapshot
                                                                .data![index]
                                                                .initialPrice!
                                                                .toString(),
                                                          ));
                                                        }).onError((error,
                                                                stackTrace) {
                                                          print(
                                                              error.toString());
                                                        });
                                                      }
                                                    },
                                                    child: Icon(
                                                        Icons.remove_circle)),
                                                Text(
                                                  snapshot.data![index].quantity
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                InkWell(
                                                    onTap: () {
                                                      int quantity = snapshot
                                                          .data![index]
                                                          .quantity!;
                                                      int price = snapshot
                                                          .data![index]
                                                          .initialPrice!;
                                                      quantity++;
                                                      int? newPrice =
                                                          price * quantity;
                                                      dbHelper!
                                                          .updateQuantity(Cart(
                                                              id: snapshot
                                                                  .data![index]
                                                                  .id,
                                                              productId: snapshot
                                                                  .data![index]
                                                                  .id!
                                                                  .toString(),
                                                              productName: snapshot
                                                                  .data![index]
                                                                  .productName,
                                                              initialPrice: snapshot
                                                                  .data![index]
                                                                  .initialPrice,
                                                              productPrice:
                                                                  newPrice,
                                                              quantity:
                                                                  quantity,
                                                              unitTag: snapshot
                                                                  .data![index]
                                                                  .unitTag
                                                                  .toString(),
                                                              image: snapshot
                                                                  .data![index]
                                                                  .image
                                                                  .toString()))
                                                          .then((value) {
                                                        newPrice = 0;
                                                        quantity = 0;
                                                        cart.addTotalPrice(
                                                            double.parse(
                                                          snapshot.data![index]
                                                              .initialPrice!
                                                              .toString(),
                                                        ));
                                                      }).onError((error,
                                                              stackTrace) {
                                                        print(error.toString());
                                                      });
                                                    },
                                                    child:
                                                        Icon(Icons.add_circle))
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ]),
                            ),
                          );
                        }));
              } else {
                return Text("data");
              }
            }),
        Consumer<CartProvider>(builder: (context, value, child) {
          return Visibility(
            visible:
                value.getTotalPrice().toStringAsFixed(2) == "00" ? false : true,
            child: Column(
              children: [
                ReusableWidget(
                    title: "Sub Total",
                    value: r"Rs" + value.getTotalPrice().toStringAsFixed(2))
              ],
            ),
          );
        })
      ]),
    );
  }
}

class ReusableWidget extends StatelessWidget {
  final String title, value;
  const ReusableWidget({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Total",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
              Text(value.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      fontStyle: FontStyle.italic)),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          ElevatedButton(
            onPressed: () {
              NotificationService.display("Successfully", "We take you Order",
                  "This is Extra data", context);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xfff123456),
                padding: EdgeInsets.all(10),
                minimumSize: Size(300, 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            child: Text(
              "Order Now",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          )
        ],
      ),
    );
  }
}
