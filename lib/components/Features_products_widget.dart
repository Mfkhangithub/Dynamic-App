import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class ProductWidget extends StatelessWidget {
  final String imagePath;
  final String productName;
  final String productPrice;
  final String currency;
  final String discount;
  final VoidCallback ontap;
  final Color color;

  const ProductWidget({
    super.key,
    required this.imagePath,
    required this.productName,
    required this.productPrice,
    required this.currency,
    required this.discount,
    required this.ontap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width * 0.9;
    double imageWidth = cardWidth * 0.3;

    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.white,
      child: Container(
        width: cardWidth,
        padding: const EdgeInsets.all(8.0),
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: imageWidth,
              height: imageWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: CachedNetworkImage(
                  imageUrl: imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Gutter(),
                  Row(
                    children: [
                      Text(
                        "$currency :",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' $productPrice',
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const Gutter(),
                  Row(
                    children: [
                      const Text("Discount : ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(discount),
                      const Text("%")
                    ],
                  ),
                  const Gutter(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
