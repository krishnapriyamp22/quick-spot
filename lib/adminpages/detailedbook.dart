// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:quickspot/custom%20widgets/screencustom/Adetailedbooking.dart';


class BookDetails extends StatefulWidget {
  final String category;
  final int slotnumber;
  final String ownername;
  final String vehiclenum;
  final String model;
  final String license;
  final String entreDate;
  final String exitDate;
  final String enterTime;
  final String exitTime;
  String payment;

   BookDetails(
      {required this.category,
      required this.slotnumber,
      required this.ownername,
      required this.vehiclenum,
      required this.model,
      required this.license,
      required this.entreDate,
      required this.exitDate,
      required this.enterTime,
      required this.exitTime,
      required this.payment,
      super.key});

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
       appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 6, 49, 83),
          centerTitle: true,
          iconTheme: IconThemeData(color: Color.fromARGB(255, 241, 241, 241)),
          title: Text(
            "Booking Details",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 13, right: 13),
          child: Column(
            children: [
              SizedBox(height: 20),
              SizedBox(height: 20,),
              Adetailedbooking(widget: widget),
              SizedBox(height: 20 ),
              container(),
              SizedBox(height: 20,),
              row(),
              SizedBox(height: 10,),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     SizedBox(height: 10,),
                      Text("Slot number    : ${(widget.category == 'Floor1')
                                ? 'T${widget.slotnumber}'
                                : (widget.category == 'Floor2')
                                    ? 'B${widget.slotnumber}'
                                    : (widget.category == 'Floor3')
                                        ? 'C${widget.slotnumber}'
                                        : 'M${widget.slotnumber}'}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600,color: Colors.red)),
                      SizedBox(height: 10,),
                      Text("Owner name   : ${widget.ownername}",
                       style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600), ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "vehicle num    : ${widget.vehiclenum}",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("vehicle model : ${widget.model}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 10,
                      ),
                      Text("licence num    : ${widget.license}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Entry date        : ${widget.entreDate}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Exit date           : ${widget.exitDate}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Entry time        : ${widget.enterTime}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 10,
                      ),
                      Text("exit time           : ${widget.exitTime}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                              SizedBox(
                        height: 10,),
                              Text("Payment           : ${widget.payment}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600,color: Colors.green)),
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

