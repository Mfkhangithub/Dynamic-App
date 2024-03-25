import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:saloonstore/components/Colors.dart';
import 'package:saloonstore/components/Text_Field.dart';
import 'package:saloonstore/data/Responces/Status.dart';
import 'package:saloonstore/model/Agent_model.dart';
import 'package:saloonstore/provider/All_Deparments.dart';
import 'package:saloonstore/provider/Validation_provider.dart';
import 'package:saloonstore/services/Home_View_model.dart';
import 'package:saloonstore/utils/Constants.dart';
import 'package:saloonstore/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact_page extends StatefulWidget {
  final text;
  const Contact_page({super.key, required this.text});

  @override
  State<Contact_page> createState() => _Blogs_SceenState();
}

class _Blogs_SceenState extends State<Contact_page> {
  HomeViewModel homeviewmodel = HomeViewModel();
  late Future<void> _mapurl;

  @override
  void initState() {
    homeviewmodel.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderController>(context, listen: false);
    final messageprovider =
        Provider.of<ValidationProvider>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.text),
        ),
        body: ChangeNotifierProvider<HomeViewModel>(
            create: (BuildContext context) => homeviewmodel,
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
                _mapurl = provider.extractMapUrl(store.s45 ?? "");
                return SingleChildScrollView(
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

                      //TODO SHOWING MAP

                      FutureBuilder<void>(
                        future: _mapurl,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return Consumer<ProviderController>(
                              builder: (context, provider, child) {
                                if (provider.mapUrl != null &&
                                    provider.mapUrl!.isNotEmpty) {
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
                            <iframe width="100%" height="100%" src="${provider.mapUrl}" frameborder="0" allowfullscreen></iframe>
                          </body>
                        </html>
                      ''',
                                          mimeType: 'text/html',
                                        ),
                                        initialOptions:
                                            InAppWebViewGroupOptions(
                                          crossPlatform: InAppWebViewOptions(
                                            verticalScrollBarEnabled: true,
                                            horizontalScrollBarEnabled: true,
                                            supportZoom: true,
                                            useShouldOverrideUrlLoading: true,
                                            mediaPlaybackRequiresUserGesture:
                                                false,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return const Text('Map URL not available');
                                }
                              },
                            );
                          } else if (snapshot.hasError) {
                            // Handle the case where an error occurred
                            print('Error: ${snapshot.error}');
                            return const Text('Error loading map');
                          } else {
                            return const CircularProgressIndicator();
                          }
                        },
                      ),

                      const Gutter(),

                      Icon(
                        FontAwesomeIcons.phone,
                        color: provider.getColorFromName(store.s66 ?? ""),
                      ),
                      const Gutter(),
                      const Text(
                        "Phone",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Gutter(),
                      GestureDetector(
                        onTap: () {
                          provider.launchwhatsappURLwithphone(store.s47 ?? "");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              store.s47 ?? "",
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            const Gutter(),
                            Text(
                              "say hi",
                              style: TextStyle(
                                  color: provider
                                      .getColorFromName(store.s66 ?? "")),
                            )
                          ],
                        ),
                      ),
                      const Gutter(),
                      Icon(
                        FontAwesomeIcons.locationDot,
                        color: provider.getColorFromName(store.s66 ?? ""),
                      ),
                      const Gutter(),
                      const Text("Adress",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const Gutter(),
                      GestureDetector(
                        onTap: () {
                          provider.launchMap(store.drWebcontactaddress ?? "");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              store.drWebcontactaddress ?? " ",
                              textAlign: TextAlign.center,
                            ),
                            const Gutter(),
                            Text(
                              "Open map",
                              style: TextStyle(
                                  color: provider
                                      .getColorFromName(store.s66 ?? "")),
                            )
                          ],
                        ),
                      ),
                      const Gutter(),
                      Icon(
                        FontAwesomeIcons.envelope,
                        color: provider.getColorFromName(store.s66 ?? ""),
                      ),
                      const Gutter(),
                      const Text(
                        "Email",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Gutter(),
                      GestureDetector(
                          onTap: () {
                            provider.openGmail(store.s48 ?? "");
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(store.s48 ?? ""),
                              const Gutter(),
                              Text(
                                "Write Email",
                                style: TextStyle(
                                    color: provider
                                        .getColorFromName(store.s66 ?? "")),
                              )
                            ],
                          )),

                      const Gutter(),

                      SizedBox(
                        height: 350,
                        width: double.infinity,
                        child: ChangeNotifierProvider<HomeViewModel>(
                          create: (BuildContext context) => homeviewmodel,
                          child: Consumer<HomeViewModel>(
                            builder: (context, value, child) {
                              final List<Agents_data> agentList =
                                  value.agentList.data ?? [];
                              final List<int> shuffledIndices = List.generate(
                                  agentList.length, (index) => index)
                                ..shuffle();

                              return PageView.builder(
                                itemCount: shuffledIndices.isNotEmpty ? 1 : 0,
                                itemBuilder:
                                    (BuildContext context, int pageIndex) {
                                  if (shuffledIndices.isNotEmpty) {
                                    final int index =
                                        shuffledIndices[pageIndex];
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 150,
                                              width: 150,
                                              child: Image.network(imagespath +
                                                  (agentList[index]
                                                          .agentPhoto1 ??
                                                      "")),
                                            ),
                                            const Gutter(),
                                            Text(
                                              "Contact Our Agent# ${agentList[index].agentName ?? ""}",
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  color: AppColors.purple),
                                            ),
                                            const Center(
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 65, right: 40),
                                                child: Text(
                                                  "Contact me for any kind of gaming details you want!",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                            const Gutter(),
                                            ElevatedButton.icon(
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(0),
                                                ),
                                                backgroundColor:
                                                    AppColors.accentColor,
                                                foregroundColor:
                                                    AppColors.white,
                                              ),
                                              label: const Text("WhatsApp"),
                                              icon: const Icon(
                                                  FontAwesomeIcons.whatsapp),
                                              onPressed: () async {
                                                await provider
                                                    .launchwhatsappURLwithphone(
                                                        agentList[index]
                                                                .agentContact ??
                                                            "");
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  } else {
                                    return const Center(
                                        child: Text("No agents available"));
                                  }
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      const Gutter(),

                      //LEAVING MESSAGE SECTION
                      const Text(
                        "Leave A Message",
                        style: TextStyle(fontSize: 20),
                      ),
                      const Gutter(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Consumer<ValidationProvider>(
                              builder: (context, value, child) {
                                return Text_Field(
                                  errorttext: value.NAME.error,
                                  controller: messageprovider.Namecontorller,
                                  labeltext: "Your Name",
                                  hinttext: "Enter your name",
                                  onchange: (value) {
                                    messageprovider.validatemessagename(value);
                                  },
                                );
                              },
                            ),
                            const Gutter(),
                            Consumer<ValidationProvider>(
                              builder: (context, value, child) {
                                return Text_Field(
                                  errorttext: value.Email.error,
                                  controller: messageprovider.Emailcontorller,
                                  labeltext: "Your email",
                                  hinttext: "enter you email",
                                  onchange: (value) {
                                    messageprovider.validatemeesageemail(value);
                                  },
                                );
                              },
                            ),
                            const Gutter(),
                            Consumer<ValidationProvider>(
                              builder: (context, value, child) {
                                return Text_Field(
                                  maxline: 3,
                                  errorttext: value.Massage.error,
                                  controller: messageprovider.Messagecontorller,
                                  labeltext: "Enter your message",
                                  hinttext: "enter your message",
                                  onchange: (value) {
                                    messageprovider.validateMessage(value);
                                  },
                                );
                              },
                            ),
                            const Gutter(),
                            ElevatedButton(
                              onPressed: () async {
                                if (!messageprovider.ismessageFormValid) {
                                  utils.Show_Flushbar_Error_Message(
                                      "Please fill the fields", context);
                                } else {
                                  String emailto = store.s67 ?? "";
                                  String name =
                                      messageprovider.Namecontorller.text;

                                  String message =
                                      messageprovider.Messagecontorller.text;
                                  String defaultEmailSubject = "Support";
                                  String bodymessage =
                                      "Name: $name\n Message: $message";
                                  String emailLaunchUri =
                                      'mailto:$emailto ?subject=$defaultEmailSubject&body=$bodymessage';
                                  launch(emailLaunchUri);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.accentColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text(
                                  "Send Message",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ///////////////////////////////////////////
                      const Gutter()
                    ],
                  ),
                );
              }
              return const Center(
                child: SpinKitDoubleBounce(
                  color: AppColors
                      .accentColor, // You can set the color to match your theme
                  size: 50.0, // Adjust the size as needed
                ),
              );
            })));
  }
}
