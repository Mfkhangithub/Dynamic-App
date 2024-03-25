import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:saloonstore/components/Colors.dart';


class Latest_Products extends StatelessWidget {
  final imagepath;
  final String title;
  final String price;
  final color;
  final String currancy;

  const Latest_Products({
    super.key,
    required this.imagepath,
    required this.title,
    required this.color,
    required this.price,
    required this.currancy,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.topLeft,
          children: [
            SizedBox(
              height: 300,
              width: 300,
              child: CachedNetworkImage(
                imageUrl: imagepath,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color, // Set the container color
                ),
                padding: const EdgeInsets.all(8),
                child: IconButton(
                  icon: const Icon(
                    Icons.favorite,
                    color: AppColors.white, // You can customize the icon color
                  ),
                  onPressed: () {
                    // Handle favorite icon press
                  },
                ),
              ),
            ),
            Positioned(
              top: 8,
              left: 60,
              child: Container(
                height: 50,
                decoration:  BoxDecoration(
                  shape: BoxShape.circle,
                  color: color, // Set the contai coner color
                ),
                padding: const EdgeInsets.all(8),
                child: IconButton(
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: AppColors.white, // You can customize the icon color
                  ),
                  onPressed: () {
                    // Handle cart icon press
                  },
                ),
              ),
            ),
          ],
        ),
        Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, color: AppColors.grey),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Center(
              child: Text(
                currancy,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const Gutter(),
            Center(
              child: Text(
                price,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
