import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:saloonstore/components/Colors.dart';
import 'package:saloonstore/components/Text_Field.dart';
import 'package:saloonstore/model/Agent_model.dart';
import 'package:saloonstore/model/Store_Model.dart';
import 'package:saloonstore/provider/All_Deparments.dart';
import 'package:saloonstore/services/Home_View_model.dart';
import 'package:saloonstore/utils/Constants.dart';

class Contact extends StatefulWidget {
  final Stores store;
  final String text;
  const Contact({super.key, required this.text, required this.store});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  HomeViewModel homeviewmodel = HomeViewModel();
  late Future<void> _mapurl;
  @override
  void initState() {
    super.initState();
    homeviewmodel.fetchData();
    final provider = Provider.of<ProviderController>(context, listen: false);
    _mapurl = provider.extractMapUrl(widget.store.s45 ?? "");
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.text),
      ),
      body: SingleChildScrollView(
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
                if (snapshot.connectionState == ConnectionState.done) {
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
                              initialOptions: InAppWebViewGroupOptions(
                                crossPlatform: InAppWebViewOptions(
                                  verticalScrollBarEnabled: true,
                                  horizontalScrollBarEnabled: true,
                                  supportZoom: true,
                                  useShouldOverrideUrlLoading: true,
                                  mediaPlaybackRequiresUserGesture: false,
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
                  return const Text('Error loading map');
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),

            const Gutter(),

            Icon(
              FontAwesomeIcons.phone,
              color: provider.getColorFromName(widget.store.s66 ?? ""),
            ),
            const Gutter(),
            const Text(
              "Phone",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Gutter(),
            GestureDetector(
              onTap: () {
                provider.launchwhatsappURLwithphone(widget.store.s47 ?? "");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.store.s47 ?? "",
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const Gutter(),
                  Text(
                    "say hi",
                    style: TextStyle(
                        color:
                            provider.getColorFromName(widget.store.s66 ?? "")),
                  )
                ],
              ),
            ),
            const Gutter(),
            Icon(
              FontAwesomeIcons.locationDot,
              color: provider.getColorFromName(widget.store.s66 ?? ""),
            ),
            const Gutter(),
            const Text("Adress",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Gutter(),
            GestureDetector(
              onTap: () {
                provider.launchMap(widget.store.drWebcontactaddress ?? "");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.store.drWebcontactaddress ?? " ",
                    textAlign: TextAlign.center,
                  ),
                  const Gutter(),
                  Text(
                    "Open map",
                    style: TextStyle(
                        color:
                            provider.getColorFromName(widget.store.s66 ?? "")),
                  )
                ],
              ),
            ),
            const Gutter(),
            Icon(
              FontAwesomeIcons.envelope,
              color: provider.getColorFromName(widget.store.s66 ?? ""),
            ),
            const Gutter(),
            const Text(
              "Email",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Gutter(),
            GestureDetector(
                onTap: () {
                  provider.openGmail(widget.store.s48 ?? "");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.store.s48 ?? ""),
                    const Gutter(),
                    Text(
                      "Write Email",
                      style: TextStyle(
                          color: provider
                              .getColorFromName(widget.store.s66 ?? "")),
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
                    final List<int> shuffledIndices =
                        List.generate(agentList.length, (index) => index)
                          ..shuffle();

                    return PageView.builder(
                      itemCount: shuffledIndices.isNotEmpty ? 1 : 0,
                      itemBuilder: (BuildContext context, int pageIndex) {
                        if (shuffledIndices.isNotEmpty) {
                          final int index = shuffledIndices[pageIndex];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 150,
                                    width: 150,
                                    child: Image.network(imagespath +
                                        (agentList[index].agentPhoto1 ?? "")),
                                  ),
                                  const Gutter(),
                                  Text(
                                    "Contact Our Agent# ${agentList[index].agentName ?? ""}",
                                    style: const TextStyle(
                                        fontSize: 15, color: AppColors.purple),
                                  ),
                                  const Center(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 65, right: 40),
                                      child: Text(
                                        "Contact me for any kind of gaming details you want!",
                                        style: TextStyle(fontSize: 12),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  const Gutter(),
                                  ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                      backgroundColor: AppColors.accentColor,
                                      foregroundColor: AppColors.white,
                                    ),
                                    label: const Text("WhatsApp"),
                                    icon: const Icon(FontAwesomeIcons.whatsapp),
                                    onPressed: () async {
                                      await provider.launchwhatsappURL();
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

            const Text(
              "Leave A Message",
              style: TextStyle(fontSize: 20),
            ),
            const Gutter(),
            const Text_Field(
              labeltext: "Your Name",
              hinttext: "Enter your name",
            ),
            const Gutter(),
            const Text_Field(
                labeltext: "Your email", hinttext: "enter you email"),
            const Gutter(),
            const Text_Field(
                labeltext: "Enter your message",
                hinttext: "enter your message"),
            const Gutter(),
            ElevatedButton(
              onPressed: () {
                // Add your payment processing logic here
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
            const Gutter()
          ],
        ),
      ),
    );
  }
}
