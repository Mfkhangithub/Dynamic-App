import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:saloonstore/components/Colors.dart';
import 'package:saloonstore/provider/All_Deparments.dart';

class GetInTouch extends StatelessWidget {
  final String imageAssetPath;
  final String description;
  final String address;
  final String email;
  final String phone;
  final String fotter;
  final List<String> linkTitles;

  final List<VoidCallback> linkCallbacks;

  const GetInTouch(
      {super.key,
      required this.imageAssetPath,
      required this.description,
      required this.linkTitles,
      required this.linkCallbacks,
      required this.address,
      required this.phone,
      required this.fotter,
      required this.email,
      imag
      });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderController>(context, listen: false);
    return Container(
      color: AppColors.background_fotter_color,
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align content to the left
        children: [
          // Centered Image with Description
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl: imageAssetPath,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),

          // Useful Links
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(linkTitles.length, (index) {
                return UsefulLinkWidget(
                  title: linkTitles[index],
                  onPressed: linkCallbacks[index],
                );
              }),
            ),
          ),
          const SizedBox(height: 16.0),

          // Contact Section
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Contact",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const Gutter(),
                // Social Media Handles
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
                   
                  ],
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       SocialMediaIcon(
                       ontap: () async {
                          await provider.launchlinkURL();
                        },
                      icon: FontAwesomeIcons.linkedin,
                      color: AppColors.darkblue,
                    ),
                      SocialMediaIcon(
                       ontap: () async {
                          await provider.launcholxURL();
                        },
                      icon: FontAwesomeIcons.o,
                      color: Colors.green,
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
                      
                    ],
                  ),
                ),
                         Center(child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                            children: [    SocialMediaIcon(
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
                      ),],
                )),
                const Gutter(),
                Row(
                  children: [
                    const Text("Address: ",
                        style: TextStyle(color: AppColors.grey)),
                    const Gutter(),
                    Expanded(
                      child: Text(
                        address,
                        style: const TextStyle(color: AppColors.grey),
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    const Text("Phone: ",
                        style: TextStyle(color: AppColors.grey)),
                    const Gutter(),
                    Text(phone, style: const TextStyle(color: AppColors.grey)),
                  ],
                ),
                Row(
                  children: [
                    const Text("Email: ",
                        style: TextStyle(color: AppColors.grey)),
                    const Gutter(),
                    Text(email, style: const TextStyle(color: AppColors.grey)),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Copyright©2023 ",
                      style: TextStyle(fontSize: 13),
                    ),
                    Text(
                      fotter,
                      style: const TextStyle(fontSize: 13),
                    ),
                  ],
                ),
                const Center(child: Text(" All rights reserved")),
                Gutter()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UsefulLinkWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const UsefulLinkWidget({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(title),
    );
  }
}

class SocialMediaIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback ontap;

  const SocialMediaIcon(
      {super.key,
      required this.icon,
      required this.color,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: ontap,
      icon: Icon(
        icon,
        size: 20,
      ),
      color: color,
    );
  }
}
