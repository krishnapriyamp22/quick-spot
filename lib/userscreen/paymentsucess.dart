// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';

import 'package:quickspot/userscreen/bottomnavi.dart';

class PaymentSuccess extends StatefulWidget {
  const PaymentSuccess({Key? key}) : super(key: key);

  @override
  State<PaymentSuccess> createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2),(){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (home)=>HomesScreenPage()), (route) => false);
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            Image.asset(
              'images/succes.gif',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'Booked Successful!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            
          ],
        ),
      ),
    );
  }
}
