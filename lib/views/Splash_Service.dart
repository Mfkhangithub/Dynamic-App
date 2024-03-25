import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:saloonstore/model/Token.dart';
import 'package:saloonstore/utils/RoutName.dart';
import 'package:saloonstore/views/User_View_Model.dart';


class SplashServices {
  Future<UserToken?> getUserData() => User_view_Model().getUser();

  void Check_Authentication_User(BuildContext context) {
    // If a user is authenticated, retrieve user data and navigate to the appropriate page.
    getUserData().then((value) {
      if (value != null) {
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.pushNamed(context, Routesname.Resposive_layout);
        });  
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
