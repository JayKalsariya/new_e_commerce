import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:new_e_commerce/utils/product.dart';
import '../../utils/route_utils.dart';
import 'cart_page.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _MaterialPageState();
}

class _MaterialPageState extends State<DetailPage> {
  bool favorite = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    Map product =
        (ModalRoute.of(context)?.settings.arguments as Map?) ?? products[0];

    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        backgroundColor: Colors.grey[300],
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.first_page),
        ),
        actions: [
          IconButton.filledTonal(
            onPressed: () {
              late SnackBar snackBar;
              if (cartItems.contains(product)) {
                cartItems.remove(product);
                snackBar = SnackBar(
                  content: Text("${product['title']} removed from the CART !!"),
                  backgroundColor: Colors.red,
                  behavior: SnackBarBehavior.floating,
                );
              } else {
                // cartItems.add(product);
                snackBar = SnackBar(
                  content: Text("${product['title']} collected in CART !!"),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                );
              }

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.grey.shade200),
            ),
            icon: const Icon(Icons.shopping_bag),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                // reverse: true,
                height: size.height * 0.35,
                autoPlayInterval: const Duration(milliseconds: 1500),
                enableInfiniteScroll: true,
                scrollPhysics: const BouncingScrollPhysics(),
                enlargeCenterPage: true,
              ),
              items: List.generate(
                product['images'].length,
                (index) => Container(
                  width: size.width * 0.8,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    // color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(product['images'][index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              // flex: 1,
              child: Column(
                children: [
                  Container(
                    // height: size.height * 0.1,
                    width: size.width * 0.99,
                    // color: Colors.black,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              product['title'],
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            // ElevatedButton(
                            //   child: new Text('Change Color'),
                            //   textColor: Colors.white,
                            //   // 2
                            //   color:
                            //       _hasBeenPressed ? Colors.blue : Colors.black,
                            //   // 3
                            //   onPressed: () => {
                            //     setState(() {
                            //       _hasBeenPressed = !_hasBeenPressed;
                            //     })
                            //   },
                            // )
                            ActionChip(
                              label: const Text('Favorite'),
                              avatar: const Icon(Icons.favorite_border),
                              onPressed: () {
                                setState(() {
                                  favorite = !favorite;
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$ ${product['price']}/-".toString(),
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.red.shade500,
                              ),
                            ),
                            // RatingBarIndicator(
                            //   rating:
                            //       double.parse(product['rating'].toString()),
                            //   itemCount: 5,
                            //   itemSize: 18,
                            //   itemBuilder: (context, index) => const Icon(
                            //     Icons.star,
                            //     color: Colors.yellow,
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      // height: size.height * 0.1,
                      // width: size.width * 0.9,
                      color: Colors.grey,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      // height: size.height * 0.1,
                      width: size.width * 0.99,
                      // color: Colors.black,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Description',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            product['description'],
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xff8F959E),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      //Place order
      floatingActionButton: Container(
        height: 50,
        width: size.width * 0.9,
        decoration: BoxDecoration(
          color: const Color(0xff9775FA),
          borderRadius: BorderRadius.circular(50),
        ),
        alignment: Alignment.center,
        child: const Text(
          "Place Order",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
