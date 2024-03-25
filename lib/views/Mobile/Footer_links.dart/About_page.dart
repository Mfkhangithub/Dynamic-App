import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:saloonstore/components/Colors.dart';
import 'package:saloonstore/data/Responces/Status.dart';
import 'package:saloonstore/provider/All_Deparments.dart';
import 'package:saloonstore/services/Home_View_model.dart';
import 'package:saloonstore/utils/Constants.dart';

class About_Us_page extends StatefulWidget {
  final text;
  const About_Us_page({super.key, required this.text});

  @override
  State<About_Us_page> createState() => _Blogs_SceenState();
}

class _Blogs_SceenState extends State<About_Us_page> {
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
          title: Text(widget.text),
        ),
        body: ChangeNotifierProvider<HomeViewModel>(
            create: (BuildContext context) => homeViewModel,
            child: Consumer<HomeViewModel>(builder: (context, value, child) {
              if (value.storelist.status == Status.LOADING) {
                return const Center(
                  child: SpinKitThreeBounce(
                    color: AppColors
                        .primaryColor, // You can set the color to match your theme
                    size: 50.0, // Adjust the size as needed
                  ),
                );
              } else if (value.storelist.status == Status.ERROR) {
                return const Center(
                  child: Text("error loading data"),
                );
              } else if (value.storelist.status == Status.COMPLETED) {
                final store = value.storelist.data!;
                return SingleChildScrollView(
                  child: Column(children: [
                    const Gutter(),
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
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          widget.text,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                    const Gutter(),
                    SizedBox(
                      height: 300,
                      width: 300,
                      child: CachedNetworkImage(
                        imageUrl: imagespath + (store.drWebaboutbanner ?? ""),
                        fit: BoxFit.contain,
                      ),
                    ),
                    // ... rest of your conten

                    const Gutter(),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          store.drWebaboutheading ?? "",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const Gutter(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(store.drWebaboutp1 ?? ""),
                    ),
                    const Gutter(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(store.drWebaboutp2 ?? " "),
                    ),
                    const Gutter(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(store.drWebaboutp3 ?? ""),
                    ),
                    const Gutter(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(store.drWebaboutp4 ?? ""),
                    ),
                    const Gutter(),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Share On: ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
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
                  ]),
                );
              }
              return const Center(
                child: SpinKitThreeBounce(
                  color: AppColors
                      .primaryColor, // You can set the color to match your theme
                  size: 50.0, // Adjust the size as needed
                ),
              );
            })));
  }
}
