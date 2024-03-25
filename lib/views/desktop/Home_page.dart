import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:saloonstore/components/Colors.dart';
import 'package:saloonstore/components/Desktop_service.dart';
import 'package:saloonstore/components/Team_card.dart';


class Desktop_home_page extends StatefulWidget {
  const Desktop_home_page({super.key});

  @override
  State<Desktop_home_page> createState() => _Desktop_home_pageState();
}

class _Desktop_home_pageState extends State<Desktop_home_page> {
  late SwiperController _swiperController;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _swiperController = SwiperController();
  }

  //images for swiper
  var images = [
    'assets/we.jpg',
    'assets/welox.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(onTap: () {}, child: const Icon(Icons.menu)),
        title: const Text("Weblox"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                GestureDetector(onTap: () {}, child: const Icon(Icons.search)),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Scroll to the top when FloatingActionButton is pressed
          _scrollController.animateTo(0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut);
        },
        child: const Icon(
          Icons.arrow_upward,
          color: AppColors.primaryColor,
        ),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          // You can add more conditions if needed
          if (scrollNotification is ScrollEndNotification) {
            // Perform actions when scrolling ends
          }
          return false;
        },
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 400,
                  child: Swiper(
                    controller: _swiperController,
                    itemBuilder: (BuildContext context, int index) {
                      return Image.asset(
                        images[index],
                        width: MediaQuery.of(context)
                            .size
                            .width, // Set image width to screen width
                        height: 500, // Set a fixed height for the image
                        scale: 1,
                        // fit: BoxFit.cover,
                      );
                    },
                    itemCount: 2,
                    itemWidth: MediaQuery.of(context)
                        .size
                        .width, // Set item width to screen width
                    layout: SwiperLayout.DEFAULT,
                    autoplay: true,
                    pagination: const SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                        activeColor:
                            Colors.blue, // Set the color of the active dot
                        color: AppColors
                            .layout, // Set the color of the inactive dots
                      ),
                    ),
                    control: const SwiperControl(),
                  ),
                ),
                const Gutter(),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 500, // Set the height of the image as needed
                          child: Image.asset(
                            'assets/logo.png',
                            scale: 1,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: const EdgeInsets.all(120),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'About Us',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "About HighTech Agency And \n It's Innovative IT Solutions",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Welcome to Weblox Tech, your trusted partner in web development and digital marketing services. With a legacy of excellence spanning over five years, we have established ourselves as a leading provider in the industry. Our commitment to delivering high-quality solutions and exceptional customer service has enabled us to successfully complete numerous projects, helping businesses thrive in the digital landscape.At Weblox Tech, we understand the power of a strong online presence in today's competitive market. We specialize in web development, creating cutting-edge websites that not only captivate users but also drive measurable results. Our team of skilled developers possesses a deep understanding of the latest technologies and trends, allowing us to deliver tailored solutions that align with your business goals.",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gutter(),
                const Text(
                  "Our Services",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: Text(
                    "Services Built Specifically For \n Your Business",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                //services widget
                const DesktopService(),

                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Our Team",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor),
                ),
                const Text(
                  "Meet our expert Team",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                const Gutter(),
                //team widget 
                const Team_card(),
                const Gutter(),
                //contact widget 
              ],
            ),
          ),
        ),
      ),
    );
  }
}
