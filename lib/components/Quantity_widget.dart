import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saloonstore/provider/Quantity_provider.dart';

class QuantityWidgetContent extends StatelessWidget {
  final String productName;

  const QuantityWidgetContent({
    super.key,
    required this.productName,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuantityProvider>(
      create: (context) => QuantityProvider(),
      key: Key(productName), // Use the productName as a key
      child: Consumer<QuantityProvider>(
        builder: (context, quantityProvider, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        quantityProvider.decrement();
                      },
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    '${quantityProvider.quantity}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(width: 8.0),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.blue, // Use your desired color
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        quantityProvider.increment();
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
            ],
          );
        },
      ),
    );
  }
}
