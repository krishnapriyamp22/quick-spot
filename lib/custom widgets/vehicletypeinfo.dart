// ignore_for_file: prefer_const_constructors, unused_local_variable, non_constant_identifier_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class VehicleTypeContainer extends StatelessWidget {
  final IconData icon;
  final String text;
  final IconData icon1;

  const VehicleTypeContainer({
    required this.icon,
    required this.text,
    required this.icon1
  });

  @override
  Widget build(BuildContext context) {
     Orientation orientation = MediaQuery.of(context).orientation;
    double screenWidth = MediaQuery.of(context).size.width;
    double ScreenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color.fromARGB(255, 6, 49, 83),
        ),
        child: Row(
        //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
              },
              icon: Icon(
                
                icon,
                size: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10,
            width: screenWidth*0.08,),
            Align(alignment: Alignment.center,
              child: Text(
                text,
              
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  //fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Spacer(),
            IconButton(onPressed: (){}, icon: Icon(
               icon1,
                size: 21,
                color: Colors.white,
            ))
          ],
        ),
      ),
    );
  }
}
