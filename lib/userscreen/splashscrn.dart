// ignore_for_file: file_names, unused_import, use_key_in_widget_constructors, prefer_const_constructors, use_build_context_synchronously, no_leading_underscores_for_local_identifiers, unrelated_type_equality_checks, unnecessary_null_comparison, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:quickspot/main.dart';
import 'package:quickspot/userscreen/bottomnavi.dart';
import 'package:quickspot/userscreen/welcomepage.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:lottie/lottie.dart';
class ScreenSplash extends StatefulWidget {
  const ScreenSplash({Key? key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    gotoLogin(context);
   // checkUserLoggin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0XFF0D223C),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(
            //   'images/front.mov',
                Lottie.asset("images/splash.json",height: 760, filterQuality: FilterQuality.high,fit: BoxFit.fill),
            //   fit: BoxFit.cover,
            // ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Future<void> gotoLogin(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 10));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  Welcome(),));
  }

  Future<void> checkUserLoggin() async {
      final _sharedprefs = await SharedPreferences.getInstance();
      final userLoggedin= _sharedprefs.setBool(save_key, true);
    if (userLoggedin == null || userLoggedin == false) {
      gotoLogin(context);
    } else {
      await Future.delayed(Duration(seconds: 17));
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => HomesScreenPage()));
    }
  }
  
}
