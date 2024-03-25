import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:saloonstore/components/Adds_widget.dart';
import 'package:saloonstore/components/Colors.dart';
import 'package:saloonstore/data/Responces/Status.dart';
import 'package:saloonstore/model/Ads_model.dart';
import 'package:saloonstore/provider/All_Deparments.dart';
import 'package:saloonstore/services/Home_View_model.dart';
import 'package:saloonstore/utils/Constants.dart';
import 'package:url_launcher/url_launcher.dart';

class Offer_widget extends StatefulWidget {
  const Offer_widget({super.key});

  @override
  State<Offer_widget> createState() => _Offer_widgetState();
}

class _Offer_widgetState extends State<Offer_widget> {
  HomeViewModel homeViewModel = HomeViewModel();
  @override
  void initState() {
    homeViewModel.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Offers"),
      ),
      body: ChangeNotifierProvider<HomeViewModel>(
        create: (BuildContext context) => homeViewModel,
        child: Consumer<HomeViewModel>(builder: (context, value, child) {
          if (value.storelist.status == Status.LOADING ||
              value.adslist.status == Status.LOADING) {
            return const Center(
              child: SpinKitThreeBounce(
                color: AppColors.primaryColor,
                size: 50.0,
              ),
            );
          } else if (value.storelist.status == Status.ERROR ||
              value.adslist.status == Status.ERROR) {
            return const Center(
              child: Text("Error loading data"),
            );
          } else if (value.storelist.status == Status.COMPLETED ||
              value.adslist.status == Status.COMPLETED) {
            final store = value.storelist.data!;
            return Column(
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        provider.getColorFromName(store.s66 ?? ""),
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
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Latest offers in market",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                const Gutter(),
                Expanded(
                  child: ListView.builder(
                    itemCount: value.adslist.data!.length,
                    itemBuilder: (context, index) {
                      final Ads_data adsData = value.adslist.data![index];

                      return GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Blog_detail(
                            //             blogList: blogsData,
                            //             selectedIndex: index,
                            //             store: store)));
                          },
                          child: AddsWidget(
                            ontap: () {
                              // Function to show the details dialog
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(adsData.adTitle ?? ""),
                                    content: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          children: [
                                            const Text(
                                              "Title: ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Expanded(
                                              child: Text(
                                                adsData.adTitle ?? "",
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Expanded(
                                                child: Text("Date Published: ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold))),
                                            Expanded(
                                                child:
                                                    Text(adsData.adDate ?? ""))
                                          ],
                                        ),
                                        const SizedBox(height: 16),
                                        Row(
                                          children: [
                                            const Text("Details:",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(adsData.adDetails ?? "")
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text("Brand: ",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(adsData.adBrand ?? "")
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text("Type: ",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(adsData.adType ?? "")
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text("Comments: ",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(adsData.adComments ?? "")
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              "Visit Link: ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () async {
                                                  final String adLink =
                                                      adsData.adLink ?? "";
                                                  const String prefix =
                                                      "https://www.wakafridi.com/";

                                                  // Check if the link has the desired prefix
                                                  if (!adLink
                                                      .startsWith(prefix)) {
                                                    // If not, concatenate the prefix to the link
                                                    final Uri linkUri =
                                                        Uri.parse(
                                                            prefix + adLink);
                                                    await launch(
                                                        linkUri.toString());
                                                  } else {
                                                    // If it already has the prefix, launch the link as is
                                                    await launch(adLink);
                                                  }
                                                },
                                                child: Text(
                                                  adsData.adLink ?? "",
                                                  style: TextStyle(
                                                      color: provider
                                                          .getColorFromName(
                                                              store.s66 ?? "")),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColors.red,
                                            foregroundColor: AppColors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  5), // Set the border radius to 0 for a square shape
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Close"))
                                    ],
                                  );
                                },
                              );
                            },
                            title: adsData.adTitle ?? "",
                            color: provider.getColorFromName(store.s66 ?? ""),
                            image: imagespath + (adsData.adPhoto1 ?? ""),
                          ));
                    },
                  ),
                ),
              ],
            );
          }

          return const Center(
            child: SpinKitThreeBounce(
              color: AppColors.primaryColor,
              size: 50.0,
            ),
          );
        }),
      ),
    );
  }
}
