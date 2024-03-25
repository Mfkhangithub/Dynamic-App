import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saloonstore/provider/Cart_provider.dart';
import 'package:saloonstore/provider/Validation_provider.dart';
import 'package:saloonstore/services/Home_View_model.dart';
import 'package:saloonstore/utils/RoutName.dart';
import 'package:saloonstore/utils/Routes.dart';
import 'package:saloonstore/views/User_View_Model.dart';
import 'provider/All_Deparments.dart';
import 'provider/Payment_provider.dart';
import 'provider/Three_taps_counter.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) => ProviderController()),
              ChangeNotifierProvider(create: (context) => HomeViewModel()),
              ChangeNotifierProvider(create: (context) => ValidationProvider()),
              ChangeNotifierProvider(create: (context) => User_view_Model()),
              ChangeNotifierProvider(create: (context) => PaymentProvider()),
              ChangeNotifierProvider(create: (context) => CartProvider()),
              ChangeNotifierProvider(create: (context) => CounterProvider()),
            ],
            child: MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                textTheme:
                    GoogleFonts.mulishTextTheme(Theme.of(context).textTheme)
                        .apply(bodyColor: Colors.black),
                pageTransitionsTheme: const PageTransitionsTheme(builders: {
                  TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
                  TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
                }),
              ),
              debugShowCheckedModeBanner: false,
              initialRoute: Routesname.spalsh_screen,
              onGenerateRoute: (settings) =>
                  Routes.generateRoutes(settings),
            ),
          );
  }
}
