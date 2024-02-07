import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:new_e_commerce/utils/product.dart';

import '../../utils/route_utils.dart';

Widget productCard({
  required Size size,
  required int index,
  required BuildContext context,
}) {
  return Expanded(
    child: Container(
      height: size.height * 0.3,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  Routes.detailPage,
                );
              },
              child: Container(
                height: size.height * 18 / 100,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(15),
                  // color: Colors.grey.shade50,
                  image: DecorationImage(
                    image: NetworkImage(products[index]['thumbnail']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                products[index]['title'],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "\$ ${products[index]['price']}/-".toString(),
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.red,
                  decorationThickness: 1.5,
                  fontSize: 18,
                  color: Colors.red.shade500,
                ),
              ),
            ),
            // RatingBarIndicator(
            //   rating: double.parse(product['rating'].toString()),
            //   itemCount: 5,
            //   itemSize: 12,
            //   itemBuilder: (context, index) => const Icon(
            //     Icons.star,
            //     color: Colors.yellow,
            //   ),
            // ),
          ],
        ),
      ),
    ),
  );
}
