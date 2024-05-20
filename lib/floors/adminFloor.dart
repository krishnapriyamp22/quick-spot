// ignore_for_file: unused_import, camel_case_types, prefer_const_constructors, must_be_immutable, sized_box_for_whitespace, file_names, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quickspot/fuctions/slotfunction.dart';
import 'package:quickspot/models/booked.dart';


class adminSlotView extends StatefulWidget {
  adminSlotView({required this.floorIs, Key? key})
      : super(key: key);
  String floorIs;

  @override
  State<adminSlotView> createState() => _adminSlotViewState();
}

class _adminSlotViewState extends State<adminSlotView> {
  Slotfunction slots = Slotfunction();

  @override
  void initState() {
    super.initState();
    slots.getallslots();
  }

  @override
  Widget build(BuildContext context) {
    slots.getallslots();
    final filteredslotsss = slotlist.value
        .where((slotss) => slotss.category == widget.floorIs)
        .toList();
    slotlist.value = filteredslotsss;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 670,
              width: 500,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GridView.builder(
                    itemCount: slotlist.value.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 6,
                    ),
                    itemBuilder: (BuildContext context, index) {
                      final bookedBox = Hive.box<Booked>('booked');
                      final isSlotBooked = bookedBox.values.any(
                          (booked) =>
                              booked.category == widget.floorIs &&
                              booked.slotnumber == index);

                      return InkWell(
                         
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: isSlotBooked
                                ? Colors.red
                                : 
                                    Colors.grey,
                          ),
                          child: Center(
                            child: Column(
                              mainAxisSize:MainAxisSize.min,
                              children: [        
                                Icon(
                                  (widget.floorIs == 'Floor1')
                                      ? Icons.local_shipping
                                      : (widget.floorIs == 'Floor2')
                                          ? Icons.directions_bus
                                          : (widget.floorIs == 'Floor3')
                                              ? Icons.directions_car
                                              : Icons.motorcycle,
                                  color: Colors.white,
                                ),Text(
                                   (widget.floorIs == 'Floor1')
                                  ? 'T$index'
                                  : (widget.floorIs == 'Floor2')
                                      ? 'B$index'
                                      : (widget.floorIs == 'Floor3')
                                          ? 'C$index'
                                          : 'M$index',style: TextStyle(fontWeight:FontWeight.w900 ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
