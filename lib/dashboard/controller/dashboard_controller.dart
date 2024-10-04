import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../auth/view/login_screen.dart';
import '../../utlils/custom_dialog.dart';
import '../../utlils/firebase_consts.dart';
import '../../utlils/firebase_main.dart';
import '../../utlils/shared_preference.dart';

class DashboardController {
  Future<void> signout(BuildContext context) async {
    bool isSuccess = false;
    try {
      isSuccess = await FirebaseMain().googleLogout();
      if (isSuccess) {
        Shared_Preference.setBool(SharedPreferenceKeys.isLogin, false);
        Shared_Preference.clear();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
            (route) => false);
      }
    } catch (error) {
      if (error == FirebaseCollections.noInternetString) {
        CustomDialog().dialog(
            context: context,
            onPress: () {
              Navigator.pop(context);
              signout(context);
            },
            isCancelAvailable: true,
            successButtonName: "Retry",
            title: "No internet connection",
            content: "check your internet connectivity");
      }
    }
  }
}
