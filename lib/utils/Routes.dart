
import 'package:flutter/material.dart';
import 'package:saloonstore/utils/Responsive_layout.dart';
import 'package:saloonstore/utils/RoutName.dart';
import 'package:saloonstore/views/Mobile/Footer_links.dart/About_page.dart';
import 'package:saloonstore/views/Mobile/Footer_links.dart/Blogs_page.dart';
import 'package:saloonstore/views/Mobile/Footer_links.dart/Contact_page.dart';
import 'package:saloonstore/views/Mobile/Footer_links.dart/Offers.dart';
import 'package:saloonstore/views/Mobile/Home_page.dart';
import 'package:saloonstore/views/Mobile/jobs.dart';
import 'package:saloonstore/views/Splash_Screen.dart';
import 'package:saloonstore/views/Tablet/Home_page.dart';
import 'package:saloonstore/views/desktop/Home_page.dart';


class Routes {
  static Route<dynamic> generateRoutes(
    RouteSettings settings,
    // String? storeTitle, // Add storeTitle parameter
  ) {
    switch (settings.name) {
      case Routesname.spalsh_screen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Splash_Screen());
      case Routesname.Blogs:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Blogs_Screen(
                  text: "Blogs",
                ));
      case Routesname.About_Us:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                const About_Us_page(text: "About Us"));
      case Routesname.Job:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Jobs_page(text: "Job"));
      case Routesname.offer:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Offer_widget());

      case Routesname.Contact:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                const Contact_page(text: "Contact"));
      case Routesname.Resposive_layout:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Resposive_layout(
                MobileApp: HomePage(),
                DesktopApp: Tablet_home_page(),
                TabletApp: Desktop_home_page()));
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(child: Text("route doenot define")),
          );
        });
    }
  }
}
