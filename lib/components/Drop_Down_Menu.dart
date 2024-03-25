import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:saloonstore/components/Colors.dart';
import 'package:saloonstore/provider/All_Deparments.dart';

class CustomDropdownButton extends StatelessWidget {
  final color;
  final ontap;
  const CustomDropdownButton(
      {super.key, required this.color, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderController>(
      builder: (context, provider, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: ontap,
              child: Container(
                color: color,
                padding: const EdgeInsets.all(13),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.menu, color: AppColors.white),
                        SizedBox(width: 8.0),
                        Text(
                          "Category",
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: 8.0),
                        Icon(FontAwesomeIcons.angleDown,
                            color: AppColors.white),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
