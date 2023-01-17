import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:online_mobile/widget/FLoatingbutton/cart.dart';
import 'package:online_mobile/widget/FLoatingbutton/cart_model.dart'
    as CartModel;
import 'package:online_mobile/widget/FLoatingbutton/cart_provider.dart';
import 'package:online_mobile/widget/FLoatingbutton/db_helper.dart';
import 'package:provider/provider.dart';

import '../services/notification_service.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class list_laptop extends StatefulWidget {
  const list_laptop({super.key});

  @override
  State<list_laptop> createState() => _list_laptopState();
}

class _list_laptopState extends State<list_laptop> {
  DBHelper? dbHelper = DBHelper();
  bool added = false;
  List<String> productName = [
    "Iphone 14 pro max",
    "Iphone 13 pro max",
    "Iphone 12 pro max",
    "Iphone 11 pro max",
    "Macbook Air",
    "Macbook Pro",
    "Macbook Air",
    "Macbook Pro",
    "First generation",
    "Second generation",
    "Airpod pro",
    "Eighth generation",
    "Ninth generation",
  ];
  List<String> productUnit = [
    "A16 Bioninc chip",
    "A15 Bioninc chip",
    "A14 Bioninc chip",
    "A13 Bioninc chip",
    "M2 chip",
    "M1 chip",
    "M2 chip",
    "M1 chip",
    "Airpods",
    "Airpods",
    "Airpods",
    "Ipad",
    "Ipad",
  ];

  List<int> productPrice = [
    220000,
    200000,
    180000,
    140000,
    250000,
    248000,
    218000,
    220000,
    30000,
    40000,
    50000,
    170000,
    200000,
  ];
  List<String> productImage = [
    "https://images.hindustantimes.com/tech/img/2022/05/26/original/iPhone_14_Pro_-_Purple_-_Side_by_Side_-_Black_1653563441274.jpg",
    "https://assets.gqindia.com/photos/614c72e1b893c9963af91bc8/master/pass/iPhone-13.jpg",
    "https://www.apple.com/newsroom/images/product/iphone/standard/Apple_announce-iphone12pro_10132020_big.jpg.large.jpg",
    "https://www.apple.com/newsroom/images/tile-images/Apple_iPhone-11-Pro_Most-Powerful-Advanced_091019.jpg.og.jpg?202211022218",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwZ9vNIAvdLxVN-DQm2famvvpPa0tJtKH0Mg&usqp=CAU",
    "https://images.hindustantimes.com/tech/img/2022/12/16/960x540/dmitry-chernyshov-mP7aPSUm7aE-unsplash_1669374360829_1671160112755_1671160112755.jpg",
    "https://assets-prd.ignimgs.com/2022/06/17/applemacbookprom2-1655488149423.jpg",
    "https://9to5mac.com/wp-content/uploads/sites/6/2022/08/macbook-pro-2022.jpg?quality=82&strip=all",
    "https://fdn.gsmarena.com/imgroot/news/22/09/apple-airpods-pro-2-ofic/inline/-1200/gsmarena_001.jpg",
    "https://9to5mac.com/wp-content/uploads/sites/6/2022/09/Screenshot-2022-09-07-at-1.47.31-PM.jpg?quality=82&strip=all",
    "https://www.reviewgeek.com/p/uploads/2022/09/6084e6fc.jpg?height=200p&trim=2,2,2,2&crop=16:9",
    "https://www.apple.com/v/ipad-air/s/images/meta/ipad-air_overview__cahgij9otxua_og.png?202211162139",
    "https://i.pcmag.com/imagery/articles/07fOXHEXdbQv0yowaTqfmsY-43.fit_lim.v1646770013.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    // final cart = Provider.of<CartProvider>(context);

    return Consumer<CartProvider>(builder: (context, cart, child) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CartScreen(
                          id: null,
                        )));
          },
          backgroundColor: Color(0xfff123456),
          child: Badge(
            badgeContent: Consumer<CartProvider>(
              builder: (context, value, child) {
                return Text(
                  value.getCounter().toString(),
                  style: TextStyle(color: Colors.white, fontSize: 18),
                );
              },
            ),
            animationDuration: Duration(milliseconds: 300),
            child: Icon(
              Icons.shopping_cart_checkout_rounded,
              size: 30,
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Color(0xfff123456),
          title: Align(
            alignment: Alignment.center,
            child: Text(
              "Macbook's(Laptops)",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 32, 32, 135),
            Color.fromARGB(172, 122, 183, 183)
          ], begin: Alignment.centerRight, end: Alignment.centerLeft)),
          child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                      itemCount: productName.length,
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
                                        productImage[index].toString(),
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
                                        Text(
                                          productName[index].toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        Text(
                                          productUnit[index].toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          "\Rs. " +
                                              productPrice[index].toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                              fontSize: 16),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              22)),
                                                  minimumSize: Size(100, 30),
                                                  backgroundColor:
                                                      Color(0xff123456)),
                                              onPressed: () {
                                                NotificationService.display(
                                                    "Succefully",
                                                    "Item Added to Cart",
                                                    "This is Extra data",
                                                    context);
                                                print(index);
                                                print(index);
                                                print(productName[index]
                                                    .toString());
                                                print(productPrice[index]
                                                    .toString());
                                                print(productPrice[index]);
                                                print(1);
                                                print(productUnit[index]
                                                    .toString());

                                                print(productImage[index]
                                                    .toString());

                                                dbHelper!
                                                    .insert(CartModel.Cart(
                                                        id: index,
                                                        productId:
                                                            index.toString(),
                                                        productName:
                                                            productName[index]
                                                                .toString(),
                                                        initialPrice:
                                                            productPrice[index],
                                                        productPrice:
                                                            productPrice[index],
                                                        quantity: 1,
                                                        unitTag:
                                                            productUnit[index]
                                                                .toString(),
                                                        image:
                                                            productImage[index]
                                                                .toString()))
                                                    .then((value) {
                                                  print(
                                                      "Product is added to cart");

                                                  cart.addCounter();
                                                  cart.addTotalPrice(
                                                      double.parse(
                                                          productPrice[index]
                                                              .toString()));
                                                }).onError((error, stackTrace) {
                                                  print(error.toString());
                                                });
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        backgroundColor:
                                                            Colors.blue,
                                                        content: Text(
                                                          "added to Cart",
                                                          style: TextStyle(
                                                              fontSize: 19),
                                                        )));
                                                setState(() {
                                                  added = added;
                                                });
                                              },
                                              child: added
                                                  ? Icon(Icons.abc)
                                                  : Text("Add to cart",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14))),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ]),
                          ),
                        );
                      })),
            ],
          ),
        ),
      );
    });
  }
}
