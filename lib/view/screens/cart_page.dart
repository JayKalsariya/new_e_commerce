import 'package:flutter/material.dart';

import '../../utils/product.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        backgroundColor: Colors.grey.shade200,
        title: const Text('Your Collection'),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.first_page),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // cartItems
            //     .map(
            //       (e) => Container(
            //         height: size.height * 0.23,
            //         color: Colors.grey,
            //         margin: const EdgeInsets.only(bottom: 10),
            //         alignment: Alignment.center,
            //         child: Text(e['title']),
            //       ),
            //     )
            //     .toList(),
          ],
        ),
      ),
    );
  }
}
