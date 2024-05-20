// ignore_for_file: unused_import, must_be_immutable, prefer_const_constructors, prefer_is_empty, sized_box_for_whitespace, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quickspot/fuctions/slotfunction.dart';
import 'package:quickspot/models/vehicledetail.dart';
import 'package:quickspot/userscreen/dateTime.dart';

import '../models/booked.dart';


class UserSlotScreen extends StatefulWidget {
  UserSlotScreen({required this.vehicles, required this.floorIs, Key? key})
      : super(key: key);

  String floorIs;
  Vehicle vehicles;

  @override
  State<UserSlotScreen> createState() => _UserSlotScreenState();
}

class _UserSlotScreenState extends State<UserSlotScreen> {
  List<int> selectedList = [];
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
                        onTap: () {
                          if (isSlotBooked) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                duration: Duration(seconds: 1),
                                content: Text('This slot is already booked'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          } else {
                            setState(() {
                              if (selectedList.length < 1) {
                                if (selectedList.contains(index)) {
                                  selectedList.removeAt(0);
                                } else {
                                  selectedList.add(index);
                                }
                              } else {
                                selectedList.removeAt(0);
                                selectedList.add(index);
                              }
                            });
                          }
                        },
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: isSlotBooked
                                ? Colors.red
                                : (selectedList.contains(index))
                                    ? Colors.green
                                    : Colors.grey,
                          ),
                          child: Center(
                            child: Column(
                              mainAxisSize:MainAxisSize.min ,
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: const Color.fromARGB(255, 6, 49, 83),
            elevation: 10,
            onPressed: () {
             if(selectedList.length==1){
               Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DateScreen(
                    categoryss: widget.floorIs,
                    selectedSlot: selectedList[0],
                    vehicle: widget.vehicles,
                  ),
                ),
              );
             }else{
 ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                duration: Duration(seconds: 1),
                                content: Text('Please select slot'),
                                backgroundColor: Colors.red,
                              ));
             }
            },
            label: Text("PROCEED")),
      ),
    );
  }
}
