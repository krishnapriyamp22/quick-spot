// ignore_for_file: unused_import, use_key_in_widget_constructors, must_be_immutable, non_constant_identifier_names, override_on_non_overriding_member, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quickspot/floors/floor1.dart';
import 'package:quickspot/fuctions/slotfunction.dart';
import 'package:quickspot/models/vehicledetail.dart';


class Userslot extends StatefulWidget {
   Userslot({required this.vehicle,required this.floorIs,Key? key});
Vehicle vehicle;
String floorIs;
  @override
  State<Userslot> createState() => _UserslotState();
}

class _UserslotState extends State<Userslot> {
  int selectedfloor=1;
    Slotfunction slots = Slotfunction();

@override
InitState(){
super.initState();
slots.getallslots();
}
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 6, 49, 83),
          title:Text(' choose a slot ',style: TextStyle(fontSize: 18),) 
          ),
          body:   UserSlotScreen(floorIs: widget.floorIs,vehicles: widget.vehicle, ),
        ),
      
    );
  }
}
