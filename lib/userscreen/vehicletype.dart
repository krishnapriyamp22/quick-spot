// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import, unused_local_variable, prefer_final_fields, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:quickspot/custom%20widgets/vehicletypeinfo.dart';
import 'package:quickspot/userscreen/detail.dart';


class Vehicletype extends StatefulWidget {
  const Vehicletype({super.key});

  @override
  State<Vehicletype> createState() => _VehicletypeState();
}

class _VehicletypeState extends State<Vehicletype> {
  // ignore: unused_field
  int _selectedIndex =
      0; // Track the selected index for the bottom navigation bar

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    double screenWidth = MediaQuery.of(context).size.width;
    double ScreenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 6, 49, 83),
        title: Center(child: Text('Vehicle Type')),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              SizedBox(height: ScreenHeight * 0.09),
              
              // SizedBox(height: ScreenHeight * 0.05),
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Detail(title: "BIKE DETAILS",
                       floorIs: 'Floor4',
                      ),
                    )),
                child: VehicleTypeContainer(
                    icon: Icons.motorcycle,
                    text: 'BIKE PARKING - Floor 4',
                    icon1: Icons.arrow_forward),
              ),
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Detail(title: "CAR DETAILS",
                       floorIs: 'Floor3',
                      ),
                    )),
                child: VehicleTypeContainer(
                    icon: Icons.directions_car,
                    text: 'CAR PARKING  - Floor 3',
                    icon1: Icons.arrow_forward),
              ),
              // SizedBox(height: ScreenHeight * 0.05),
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Detail(title: "BUS DETAILS",
                       floorIs: 'Floor2',
                      ),
                    )),
                child: VehicleTypeContainer(
                    icon: Icons.directions_bus,
                    text: 'BUS PARKING  - Floor 2',
                    icon1: Icons.arrow_forward),
              ),
              // SizedBox(height: ScreenHeight * 0.05),
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Detail(
                        floorIs: 'Floor1',
                        title: "TRUCK DETAILS"),
                    )),
                child: VehicleTypeContainer(
                    icon: Icons.local_shipping,
                    text: 'TRUCK PARKING - Floor 1',
                    icon1: Icons.arrow_forward),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 30),
              //   child: Align(alignment: Alignment.bottomCenter,
              //     child: Text('when you select it will go to the floor')),
              // ),
            ],
          ),
        ),
      ),
      //bottomNavigationBar: bottomnavi(),
    );
  }
}