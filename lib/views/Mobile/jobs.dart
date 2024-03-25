import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:saloonstore/components/Colors.dart';
import 'package:saloonstore/components/Get_in_Touch.dart';
import 'package:saloonstore/components/Jobs_widget.dart';
import 'package:saloonstore/data/Responces/Status.dart';
import 'package:saloonstore/model/Jobs_model.dart';
import 'package:saloonstore/provider/All_Deparments.dart';
import 'package:saloonstore/services/Home_View_model.dart';
import 'package:saloonstore/utils/Constants.dart';
import 'package:saloonstore/utils/RoutName.dart';


class Jobs_page extends StatefulWidget {
  final text;

  const Jobs_page({super.key, required this.text});

  @override
  State<Jobs_page> createState() => _Jobs_pageState();
}

class _Jobs_pageState extends State<Jobs_page> {
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
            if (value.joblist.status == Status.LOADING ||
                value.storelist.status == Status.LOADING) {
              return const Center(
                child: SpinKitThreeBounce(
                  color: AppColors.primaryColor,
                  size: 50.0,
                ),
              );
            } else if (value.joblist.status == Status.ERROR ||
                value.storelist.status == Status.ERROR) {
              return const Center(
                child: Text("Error loading data"),
              );
            } else if (value.joblist.status == Status.COMPLETED ||
                value.storelist.status == Status.COMPLETED) {
              final store = value.storelist.data!;

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
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Our Hirings",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                          Row(
                            children: [
// ...

                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      const TextSpan(
                                        text:
                                            "With game zone sajid - SS Plaza Karkhano you can achieve in your career goals by finding the best-suited job for yourself. Send us your CV ",
                                        style:
                                            TextStyle(color: AppColors.white),
                                      ),
                                      TextSpan(
                                        text: "here",
                                        style: TextStyle(
                                          color: provider.getColorFromName(
                                              store.s66 ?? ""),
                                          decoration: TextDecoration.underline,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            provider.openGmail(store.s12 ?? "");
                                          },
                                      ),
                                      const TextSpan(
                                        text:
                                            ". Our representative will contact you soon.",
                                        style:
                                            TextStyle(color: AppColors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Gutter(),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: value.joblist.data!.length,
                      itemBuilder: (context, index) {
                        final jobs_data jobdata = value.joblist.data![index];

                        return GestureDetector(
                          onTap: () {},
                          child: JobWidget(
                            imagepath: imagespath + (jobdata.jobPhoto1 ?? ""),
                            code: jobdata.jobCode ?? "",
                            department: jobdata.jobDepartment ?? "",
                            title: jobdata.jobTitle ?? "",
                            jobCodeColor:
                                provider.getColorFromName(store.s66 ?? ""),
                            jobstartdate: jobdata.jobDate ?? "",
                            jobenddate: jobdata.jobLastdate ?? "",
                            onTap: () {
                              provider.openGmail(store.s48 ?? "");
                            },
                          ),
                        );
                      },
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
                    GetInTouch(
                      fotter: store.s9 ?? " ",
                      imageAssetPath: imagespath + (store.drWeblogo ?? ""),
                      description: store.s29 ?? "",
                      phone: store.s10 ?? " ",
                      email: store.s12 ?? "",
                      address: store.s46 ?? " ",
                      linkTitles: const [
                        'Home',
                        'About',
                        'Contact',
                        'Blog',
                        'Jobs',
                        'Offers',
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
              );
            }
            return const Center(
              child: SpinKitThreeBounce(
                color: AppColors.primaryColor,
                size: 50.0,
              ),
            );
          },
        ),
      ),
    );
  }
}
