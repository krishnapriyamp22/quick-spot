// ignore_for_file: prefer_const_constructors, file_names, avoid_unnecessary_containers, camel_case_types, unnecessary_string_interpolations, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:quickspot/adminpages/detailedbook.dart';


class Adetailedbooking extends StatelessWidget {
  const Adetailedbooking({
    super.key,
    required this.widget,
  });

  final BookDetails widget;

  @override
  Widget build(BuildContext context) {
    return Container
    (
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 140),
                child: Text(
                  "${widget.category}",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 17),
                ),
              ),
              SizedBox(
                height: 18,
              ),
             
            ],
          ),
          SizedBox(
            width: 40,
          ),

        ],
      ),
    );
  }
}
//Container
class container extends StatelessWidget {
  const container({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide())),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          
        ],
      ),
    );
  }
}

//row
class row extends StatelessWidget {
  const row({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          " Booking Details",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 50,
        )
      ],
    );
  }
}



