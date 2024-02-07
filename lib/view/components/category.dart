import 'package:flutter/material.dart';
import '../../utils/product.dart';

Widget category({
  required String category,
}) {
  return Column(
    children: [
      const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Choose category",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "View all",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xff8F959E),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  category.length,
                  (index) => Container(
                    // height: 90,
                    // width: 150,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10,
                    ),
                    margin: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade100,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3,
                          offset: Offset(3.0, 3.0),
                          // spreadRadius: 1,
                        ),
                      ],
                      border: Border.all(
                        width: 2,
                        color: Colors.primaries[index],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        category[index].toLowerCase().replaceFirst(
                              category[index][0],
                              category[index][0].toUpperCase(),
                            ),
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
