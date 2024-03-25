import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';
import 'package:saloonstore/components/Colors.dart';
import 'package:saloonstore/model/Items_model.dart';
import 'package:saloonstore/model/Store_Model.dart';
import 'package:saloonstore/provider/All_Deparments.dart';
import 'package:saloonstore/utils/Constants.dart';
import 'package:saloonstore/views/Mobile/Payment_page.dart';

class Details_page extends StatefulWidget {
  final Items_data item;
  final Stores store;

  const Details_page({super.key, required this.item, required this.store});

  @override
  State<Details_page> createState() => _Details_pageState();
}

class _Details_pageState extends State<Details_page> {
  late Future<void> _videoUrlFuture;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    final provider = Provider.of<ProviderController>(context, listen: false);
    _videoUrlFuture = provider.extractVideoUrl(widget.item.itemVideo ?? "");
    _autoScroll();
  }

  void _autoScroll() {
    Future.delayed(const Duration(seconds: 1), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(seconds: 2),
          curve: Curves.linear,
        );

        Future.delayed(const Duration(seconds: 2), () {
          if (_scrollController.hasClients) {
            _scrollController.animateTo(
              _scrollController.position.minScrollExtent,
              duration: const Duration(seconds: 2),
              curve: Curves.linear,
            );

            // Call _autoScroll again for recursion
            _autoScroll();
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align children to the start
          children: [
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    provider.getColorFromName(widget.store.s66 ?? ""),
                    Colors.black,
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  widget.item.itemName ?? "Details",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            const Gutter(),

            Center(
              child: SizedBox(
                  height: 300,
                  width: 300,
                  child: CachedNetworkImage(
                    imageUrl: imagespath + (widget.item.itemPhoto1 ?? ""),
                  )),
            ),

            // SHOWing OTHER IMAGES IN SLIDER SECTION

            SizedBox(
              height: 120, // Set a fixed height
              child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  String? photoUrl;

                  // Set the photoUrl based on the index
                  switch (index) {
                    case 0:
                      photoUrl = widget.item.itemPhoto1;
                      break;
                    case 1:
                      photoUrl = widget.item.itemPhoto2;
                      break;
                    case 2:
                      photoUrl = widget.item.itemPhoto3;
                      break;
                    case 3:
                      photoUrl = widget.item.itemPhoto4;
                      break;
                    default:
                      // Handle other cases or set a default photo URL
                      photoUrl = widget.item.itemPhoto1;
                  }

                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CachedNetworkImage(
                        imageUrl: imagespath + (photoUrl ?? ""),
                        height: 100,
                        width: 100,
                      ));
                },
              ),
            ),

            //PRODUCT VIDEO SECTION
            const Gutter(),

            FutureBuilder<void>(
              future: _videoUrlFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // Video URL extraction is complete
                  return Consumer<ProviderController>(
                    builder: (context, provider, child) {
                      if (provider.videoUrl != null &&
                          provider.videoUrl!.isNotEmpty) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 300,
                            color: AppColors.white,
                            width: 450,
                            child: InAppWebView(
                              initialData: InAppWebViewInitialData(
                                data: '''
                      <html>
                        <body>
                          <iframe width="1000" height="800" src="${provider.videoUrl}" frameborder="0" allowfullscreen></iframe>
                        </body>
                      </html>
                    ''',
                                mimeType: 'text/html',
                              ),
                              initialOptions: InAppWebViewGroupOptions(
                                crossPlatform: InAppWebViewOptions(
                                  mediaPlaybackRequiresUserGesture: false,
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return const Center(
                          child: SizedBox(
                            height: 300,
                            width: 200,
                            child: Column(
                              children: [
                                Icon(
                                  FontAwesomeIcons.videoSlash,
                                  size: 50,
                                ),
                                Text(
                                  'No video available',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    },
                  );
                } else {
                  // Show a loading indicator or placeholder while waiting
                  return const CircularProgressIndicator();
                }
              },
            ),
            const Gutter(),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                widget.item.itemName ?? "",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                "Price: ${widget.item.itemCurrency} ${widget.item.itemPrice}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: provider.getColorFromName(widget.store.s66 ?? ""),
                ),
              ),
            ),
            const Gutter(),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(widget.item.itemDetails ?? ""),
            ),
            const Gutter(),
            //CASH ON DELIVERY SECTION
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Payment_page(item: widget.item)));
                },
                style: ElevatedButton.styleFrom(
                  // Set the width and height
                  backgroundColor:
                      provider.getColorFromName(widget.store.s66 ?? ""),
                  foregroundColor: AppColors.white,
                  minimumSize: const Size(300, 50),
                ),
                child: const Text("Order Now"),
              ),
            ),

            const Gutter(),
            const Center(
              child: Text(
                "Information",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const Gutter(),
            const Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                "Product Information",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            //    Text("Availability: ${widget.item. ?? " "}"),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "Availability: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Gutter(),
                      Text(widget.item.itemStock ?? "")
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Supplier:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Gutter(),
                      Text(widget.item.itemSupplier ?? "")
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Brand: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Gutter(),
                      Text(widget.item.itemBrand ?? " ")
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Color: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Gutter(),
                      Text(widget.item.itemColor ?? "")
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Size: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Gutter(),
                      Text(widget.item.itemSize ?? "")
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                "Share On :",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      provider.launchFacebookURL();
                    },
                    icon: const Icon(
                      FontAwesomeIcons.facebook,
                      color: AppColors.darkblue,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FontAwesomeIcons.twitter,
                      color: Colors.blue,
                    )),
                IconButton(
                    onPressed: () {
                      provider.launchInstagramURL();
                    },
                    icon: const Icon(
                      FontAwesomeIcons.instagram,
                      color: AppColors.red,
                    )),
              ],
            ),
            const Gutter(),
          ],
        ),
      ),
    );
  }
}
