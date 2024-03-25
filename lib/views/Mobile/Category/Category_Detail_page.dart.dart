import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:provider/provider.dart';
import 'package:saloonstore/components/Features_products_widget.dart';
import 'package:saloonstore/model/Cart_model.dart';
import 'package:saloonstore/model/Items_model.dart';
import 'package:saloonstore/model/Store_Model.dart';
import 'package:saloonstore/provider/All_Deparments.dart';
import 'package:saloonstore/provider/Cart_provider.dart';
import 'package:saloonstore/utils/Constants.dart';
import 'package:saloonstore/views/Mobile/Deatils_page.dart';

class Category_details_page extends StatefulWidget {
  final Items_data selectedItem;
  final List<Items_data> itemList;
  final Stores store;

  const Category_details_page({
    super.key,
    required this.selectedItem,
    required this.itemList,
    required this.store,
  });

  @override
  State<Category_details_page> createState() => _Category_details_pageState();
}

class _Category_details_pageState extends State<Category_details_page> {
  @override
  Widget build(BuildContext context) {
    final selectedItem = widget.selectedItem;
    final itemList = widget.itemList;
    final provider = Provider.of<ProviderController>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedItem.itemType ?? ""),
      ),
      body: Column(
        children: [
          const Gutter(),
          const SizedBox(
            height: 50,
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Center(
                //   child: Text(
                //     selectedItem.itemQtyperpack ?? "",
                //     style: const TextStyle(fontWeight: FontWeight.bold),
                //   ),
                // ),
                // Gutter(),
                // Text(
                //   "Product Found",
                //   style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                // )
              ],
            ),
          ),
          const Gutter(),
          Expanded(
            child: ListView.builder(
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                final product = itemList[index];

                if (product.itemType == selectedItem.itemType) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Details_page(
                            item: itemList[index],
                            store: widget.store,
                          ),
                        ),
                      );
                    },
                    child: ProductWidget(
                      ontap: () {
                        // Call the addToCart method from the CartProvider
                        CartProvider cartProvider =
                            context.read<CartProvider>();
                        cartProvider.addToCart(CartItem(
                          image: product.itemPhoto1 ?? "",
                          productName: product.itemName ?? "",
                          productPrice: product.itemPrice ?? "",
                          quantity:
                              1, // You can modify this based on your requirements
                        ));
                      },
                      color: provider.getColorFromName(widget.store.s66 ?? ""),
                      discount: product.itemDiscount ?? "",
                      currency: product.itemCurrency ?? "",
                      imagePath: imagespath + (product.itemPhoto1 ?? ""),
                      productName: product.itemName ?? "",
                      productPrice: product.itemPrice ?? "",
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
