import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:saloonstore/components/Get_in_Touch.dart';
import 'package:saloonstore/model/Token.dart';
import 'package:saloonstore/provider/All_Deparments.dart';
import 'package:saloonstore/provider/Three_taps_counter.dart';
import 'package:saloonstore/utils/RoutName.dart';
import 'package:saloonstore/views/Mobile/Web_View.dart';
import 'package:saloonstore/views/User_View_Model.dart';
import 'colors.dart'; // Import your color constants

class MyDrawer extends StatefulWidget {
  const MyDrawer({
    super.key,
  });

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderController>(context, listen: false);
    final counterprovider =
        Provider.of<CounterProvider>(context, listen: false);
    User_view_Model userModel = User_view_Model();

    return FutureBuilder<UserToken?>(
      future: userModel.getUser(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          String? storeLogo = snapshot.data!.storeLogo;
          String? storeAddress = snapshot.data!.address;
          String? storefotter = snapshot.data!.fotter;
          // String? storetitle = snapshot.data!.storetitle;

          return Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                    child: CachedNetworkImage(
                  imageUrl: storeLogo ?? " ",
                )),
                const ListTile(
                  leading: Icon(
                    Icons.home,
                  ),
                  title: Text("Home"),
                ),
                const Divider(
                  thickness: 0.1,
                  color: AppColors.textColor,
                  indent: 20,
                  endIndent: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routesname.About_Us);
                  },
                  child: const ListTile(
                    leading: Icon(FontAwesomeIcons.person),
                    title: Text("About Us"),
                  ),
                ),
                const Divider(
                  thickness: 0.1,
                  color: AppColors.textColor,
                  indent: 20,
                  endIndent: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routesname.Contact);
                  },
                  child: const ListTile(
                    leading: Icon(FontAwesomeIcons.phone),
                    title: Text("Contact"),
                  ),
                ),
                const Divider(
                  thickness: 0.1,
                  color: AppColors.textColor,
                  indent: 20,
                  endIndent: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routesname.Blogs);
                  },
                  child: const ListTile(
                    leading: Icon(Icons.camera_alt),
                    title: Text("Blog"),
                  ),
                ),
                const Divider(
                  thickness: 0.1,
                  color: AppColors.textColor,
                  indent: 20,
                  endIndent: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routesname.Job);
                  },
                  child: const ListTile(
                    leading: Icon(Icons.find_in_page),
                    title: Text("Jobs"),
                  ),
                ),
                const Divider(
                  thickness: 0.1,
                  color: AppColors.textColor,
                  indent: 20,
                  endIndent: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routesname.offer);
                  },
                  child: const ListTile(
                    leading: Icon(FontAwesomeIcons.envelope),
                    title: Text("Offers"),
                  ),
                ),
                const Divider(
                  thickness: 0.1,
                  color: AppColors.textColor,
                  indent: 20,
                  endIndent: 20,
                ),
                Consumer<CounterProvider>(
                  builder: (context, counterProvider, child) {
                    return Visibility(
                      visible: counterProvider.showLoginButton,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Web_view_page(),
                            ),
                          );
                        },
                        child: const ListTile(
                          leading: Icon(Icons.person),
                          title: Text("Admin panel"),
                        ),
                      ),
                    );
                  },
                ),
                const Divider(
                  thickness: 0.1,
                  color: AppColors.textColor,
                  indent: 20,
                  endIndent: 20,
                ),
                const Gutter(),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // ... social media icons
                    SocialMediaIcon(
                      ontap: () async {
                        await provider.launchFacebookURL();
                      },
                      icon: FontAwesomeIcons.facebook,
                      color: Colors.blue,
                    ),
                    SocialMediaIcon(
                      ontap: () async {
                        await provider.launchyoutubeURL();
                      },
                      icon: FontAwesomeIcons.youtube,
                      color: AppColors.red,
                    ),
                     SocialMediaIcon(
                        ontap: () async {
                          // Handle TikTok icon tap
                          await provider.launchTiktokURL();
                        },
                        icon: FontAwesomeIcons.tiktok,
                        color: AppColors.textColor,
                      ),
                       SocialMediaIcon(
                        ontap: () async {
                          await provider.launchSnapchatURL();
                        },
                        icon: FontAwesomeIcons.snapchat,
                        color: AppColors.yellow,
                      ),
                       SocialMediaIcon(
                      ontap: () async {
                        await provider.launchInstagramURL();
                      },
                      icon: FontAwesomeIcons.instagram,
                      color: AppColors.red,
                    ),      
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     SocialMediaIcon(
                        icon: FontAwesomeIcons.weixin,
                        color: AppColors.accentColor,
                        ontap: () async {
                        provider.launchvchatURL();
                        },
                        ),
                      SocialMediaIcon(
                        ontap: () async {
                          await provider.launchtwiURL();
                        },
                      icon: FontAwesomeIcons.twitter,
                      color: Colors.blue,
                    ),
                     SocialMediaIcon(
                       ontap: () async {
                          await provider.launcholxURL();
                        },
                      icon: FontAwesomeIcons.o,
                      color: Colors.green,
                    ),
                     SocialMediaIcon(
                       ontap: () async {
                          await provider.launchlinkURL();
                        },
                      icon: FontAwesomeIcons.linkedin,
                      color: AppColors.darkblue,
                    ),
                      SocialMediaIcon(
                          icon: FontAwesomeIcons.ebay,
                          color: AppColors.textColor,
                           ontap: () async {
                          await provider.launchebyURL();
                        },
                          ),
                      GestureDetector(
                        onTap: ()async{
                         await provider.launchaliURL();
                        },
                        child: CircleAvatar(
                          backgroundImage: AssetImage("assets/aliexpres.png"),
                        radius: 13,),
                      ),
                    
                  ],

                ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      SocialMediaIcon(
                          icon: FontAwesomeIcons.amazon,
                          color: Colors.black,
                           ontap: () async {
                          await provider.launchAmURL();
                        },
                          ),
                      SocialMediaIcon(
                          icon: FontAwesomeIcons.d,
                          color: AppColors.orange,
                           ontap: () async {
                          await provider.launchDrazURL();
                        },
                          ),
                          SocialMediaIcon(
                        ontap: () async {
                          await provider.launchpriURL();
                        },
                        icon: FontAwesomeIcons.pinterest,
                        color: AppColors.red,
                      ),
                      SocialMediaIcon(
                         ontap: () async {
                          await provider.launchwhatsappURL();
                        },
                        icon: FontAwesomeIcons.whatsapp,
                        color: AppColors.accentColor,
                      ),
                   
                      ],
                ),
                const Gutter(),
                Text(
                  storeAddress ?? "",
                  textAlign: TextAlign.center,
                ),
                const Gutter(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        counterprovider.incrementCounter();
                        print(counterprovider.counter);

                        if (counterprovider.counter >= 3) {
                          counterprovider.showLoginButton;
                        }
                      },
                      child: const Text(
                        "Copyright©2023 ",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Text(storefotter ?? "",
                        style: const TextStyle(fontSize: 12)),
                  ],
                ),
                const Center(
                    child: Text(" All rights reserved",
                        style: TextStyle(fontSize: 12))),
                const Gutter()
              ],
            ),
          );
        } else {
          return const Center(child: Text("ERROR"));
        }
      },
    );
  }
}
