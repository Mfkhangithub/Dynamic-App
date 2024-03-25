import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:saloonstore/components/Blog_widget.dart';
import 'package:saloonstore/components/Colors.dart';
import 'package:saloonstore/data/Responces/Status.dart';
import 'package:saloonstore/model/Blog_model.dart';
import 'package:saloonstore/provider/All_Deparments.dart';
import 'package:saloonstore/services/Home_View_model.dart';
import 'package:saloonstore/utils/Constants.dart';
import 'package:saloonstore/views/Mobile/Blog_Detail.dart';

class Blogs_Screen extends StatefulWidget {
  final text;
  const Blogs_Screen({super.key, required this.text});

  @override
  State<Blogs_Screen> createState() => _Blogs_SceenState();
}

class _Blogs_SceenState extends State<Blogs_Screen> {
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
            child: Consumer<HomeViewModel>(
              builder: (context, value, child) {
                if (value.storelist.status == Status.LOADING ||
                    value.blogsList.status == Status.LOADING) {
                  return const Center(
                    child: SpinKitThreeBounce(
                      color: AppColors
                          .primaryColor, // You can set the color to match your theme
                      size: 50.0, // Adjust the size as needed
                    ),
                  );
                } else if (value.storelist.status == Status.ERROR ||
                    value.blogsList.status == Status.ERROR) {
                  return const Center(
                    child: Text("error loading data"),
                  );
                } else if (value.storelist.status == Status.COMPLETED ||
                    value.blogsList.status == Status.COMPLETED) {
                  final store = value.storelist.data!;
                  return Container(
                    
                    child: Column(
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
                        Expanded(
                          child: ListView.builder(
                            itemCount: value.blogsList.data!.length,
                            itemBuilder: (context, index) {
                              final Blogs_data blogsData =
                                  value.blogsList.data![index];
                    
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Blog_detail(
                                              blogList: blogsData,
                                              selectedIndex: index,
                                              store: store)));
                                },
                                child: Blog_widget(
                                  imagepath:
                                      imagespath + (blogsData.postPhotos ?? ""),
                                  time: blogsData.postDate ?? "",
                                  chat: blogsData.postComments ?? "",
                                  title: blogsData.postTitle ?? "",
                                ),
                              );
                            },
                          ),
                        ),
                        
                      ],
                    ),
                  );
                }
                return const Center(
                  child: SpinKitThreeBounce(
                    color: AppColors
                        .primaryColor, // You can set the color to match your theme
                    size: 50.0, // Adjust the size as needed
                  ),
                );
              },
            )));
  }
}
