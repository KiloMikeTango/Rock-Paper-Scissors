import 'package:flutter/material.dart';

class ImageRow extends StatelessWidget {
  final String image1;
  final String image2;
  final String image3;
  const ImageRow({
    super.key,
    required this.image1,
    required this.image2,
    required this.image3,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(image1, width: 120),
        Image.asset(image2, scale: 1.6),
        Image.asset(image3, width: 120),
      ],
    );
  }
}
