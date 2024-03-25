
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:saloonstore/components/Colors.dart';
import 'package:saloonstore/model/Blog_model.dart';
import 'package:saloonstore/model/Store_Model.dart';
import 'package:saloonstore/provider/All_Deparments.dart';
import 'package:saloonstore/utils/Constants.dart';
import 'package:saloonstore/utils/RoutName.dart';

import '../../components/Get_in_Touch.dart';

class Blog_detail extends StatefulWidget {
  final Blogs_data blogList;
  final int selectedIndex;
  final Stores store;

  const Blog_detail(
      {super.key,
      required this.blogList,
      required this.selectedIndex,
      required this.store});

  @override
  State<Blog_detail> createState() => _Blog_detailState();
}

class _Blog_detailState extends State<Blog_detail> {
  late Future<void> _videoUrlFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final provider = Provider.of<ProviderController>(context, listen: false);
    _videoUrlFuture = provider.extractVideoUrl(widget.blogList.postVideo ?? "");
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.blogList.postTitle ?? "Details",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "By ",
                        style: TextStyle(color: AppColors.white),
                      ),
                      Text(
                        widget.blogList.postAuthor ?? "",
                        style: const TextStyle(color: AppColors.white),
                      ),
                      const VerticalDivider(
                        color: AppColors.textColor,
                        thickness: 3,
                        width: 10, // Adjust the width as needed
                      ),
                      Text(
                        widget.blogList.postDate ?? "",
                        style: const TextStyle(color: AppColors.white),
                      )
                    ],
                  )
                ],
              ),
            ),
            const Gutter(),
            // VEDIO SECTION
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
                        return Center(
                          child: SizedBox(
                            height: 300,
                            width: 200,
                            child: Column(
                              children: [
                                Lottie.asset(
                                  'assets/Novideo.json',
                                ),
                                const Text(
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

            const Gutter(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.blogList.postText ?? "",
              ),
            ),
            //SHOW PHOTOS SECTION
            SizedBox(
              height: 120, // Set a fixed height for the ListView
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.blogList.postPhotos?.split(',').length ?? 0,
                itemBuilder: (context, index) {
                  List<String> photoUrls =
                      widget.blogList.postPhotos?.split(',') ?? [];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CachedNetworkImage(
                      imageUrl: Uri.encodeFull(imagespath + (photoUrls[index])),
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            const Gutter(),
            //AUDIO SECTION

            // Text(
            //   selectedBlog.postAudio ?? "",
            // ),

            const Gutter(),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Auther: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(widget.blogList.postAuthor ?? ""),
              ],
            ),
            const Gutter(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text("Category: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(widget.blogList.postCategory ?? ""),
                ],
              ),
            ),
            const Gutter(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Tags", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("All / tranding / playstation games")
                ],
              ),
            ),

            const Gutter(),
            const SizedBox(
              width: double.infinity,
              child: Text(
                "Get In Touch",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor),
              ),
            ),
            const SizedBox(
              width: double.infinity,
              child: Text(
                "Contact for any query",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const Gutter(),
            GetInTouch(
              fotter: widget.store.s9 ?? " ",
              imageAssetPath: imagespath + (widget.store.drWeblogo ?? ""),
              description: widget.store.s29 ?? "",
              phone: widget.store.s10 ?? " ",
              email: widget.store.s12 ?? "",
              address: widget.store.s46 ?? " ",
              linkTitles: const [
                'Home',
                'About',
                'Contact',
                'Blog',
                'Jobs',
                "Offers"
              ],
              linkCallbacks: [
                () {
                  Navigator.pushNamed(context, Routesname.Resposive_layout);
                },
                () {
                  Navigator.pushNamed(context, Routesname.About_Us);
                },
                () {
                  Navigator.pushNamed(context, Routesname.Contact);
                },
                () {
                  Navigator.pushNamed(context, Routesname.Blogs);
                },
                () {
                  Navigator.pushNamed(context, Routesname.Job);
                },
                () {
                  Navigator.pushNamed(context, Routesname.offer);
                }
              ],
            ),
          ],
        ),
      ),
    );
  }
}
