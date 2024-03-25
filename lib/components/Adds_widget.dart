import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:saloonstore/components/Colors.dart';


class AddsWidget extends StatelessWidget {
  final image;
  final Color color;
  final title;

  final VoidCallback ontap;

  const AddsWidget(
      {super.key,
      required this.image,
      required this.color,
      required this.title,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: CachedNetworkImage(
              imageUrl: image,
            )),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const Gutter(),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        5), // Set the border radius to 0 for a square shape
                  ),
                  backgroundColor: color,
                  foregroundColor: AppColors.white,
                ),
                onPressed: ontap,
                child: const Text("Details"),
              ),
            ),
            const Gutter()
          ],
        ),
      ),
    );
  }
}
