import 'package:flutter/material.dart';
import 'package:saloonstore/services/Home_View_model.dart';
import 'package:saloonstore/views/Splash_Service.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  SplashServices splashservice = SplashServices();
  HomeViewModel homeviewmodel = HomeViewModel();

  @override
  void initState() {
    super.initState();
    splashservice.Check_Authentication_User(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Center(
                    child: Image.asset("assets/dressericon.png"),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
