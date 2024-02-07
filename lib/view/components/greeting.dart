import 'package:flutter/material.dart';

Widget greeting({
  required Size size,
}) {
  return SizedBox(
    height: size.height * 0.1,
    // color: Colors.grey,
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30,
            letterSpacing: 1,
          ),
        ),
        Text(
          'Welcome To Laza...',
          style: TextStyle(
            color: Colors.grey,
            // fontWeight: FontWeight.bold,
            fontSize: 16,
            // letterSpacing: 1,
          ),
        ),
      ],
    ),
  );
}
