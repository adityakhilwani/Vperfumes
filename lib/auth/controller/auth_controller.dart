// function to implement the google signin

// creating firebase instance
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vperfumes/auth/model/logged_in_user_model.dart';
import 'package:vperfumes/dashboard/view/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vperfumes/utlils/custom_dialog.dart';
import 'package:vperfumes/utlils/firebase_consts.dart';
import 'package:vperfumes/utlils/firebase_main.dart';
import 'package:vperfumes/utlils/shared_preference.dart';

Future<bool> signup(BuildContext context) async {
  bool isSuccess = false;
  try {
    isSuccess = await FirebaseMain().googleLogin();
    if (isSuccess) {
      return isSuccess;
    }
  } catch (error) {
    if (error == FirebaseCollections.noInternetString) {
      CustomDialog().dialog(
          context: context,
          onPress: () {
            Navigator.pop(context);
            signup(context);
          },
          isCancelAvailable: true,
          successButtonName: "Retry",
          title: "No internet connection",
          content: "check your internet connectivity");
    }
  }
  return isSuccess;
}
