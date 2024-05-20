
// ignore_for_file: unused_import, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quickspot/floors/adminFloor.dart';


class AdminSlot extends StatefulWidget {
  const AdminSlot({Key? key});

  @override
  State<AdminSlot> createState() => _AdminSlotState();
}

class _AdminSlotState extends State<AdminSlot> {
  int selectedfloor=1;
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 6, 49, 83),
          title: Text('Floor and Slot'),
    
          bottom: TabBar(tabs: const[
            Tab(text: 'floor 1',),
            Tab(text: 'floor 2',),
            Tab(text: 'floor 3',),
            Tab(text: 'floor 4',)
          ],
          indicatorPadding: EdgeInsets.all(10),
          indicator: BoxDecoration(border: Border.all(color: Colors.white),borderRadius: BorderRadius.circular(10)),
          
          ),
        ),
        body: InkWell(
          onTap: () {
          },
          child: TabBarView(children: [
          adminSlotView( floorIs: 'Floor1'),
            adminSlotView(floorIs: 'Floor2'),
             adminSlotView(floorIs: 'Floor3'),
              adminSlotView(floorIs: 'Floor4'),
          ]),
        )
         
      ),
    );
  }
}

