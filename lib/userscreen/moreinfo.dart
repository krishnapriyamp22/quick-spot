// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class Moreinfo extends StatefulWidget {
  const Moreinfo({Key? key}) : super(key: key);

  @override
  State<Moreinfo> createState() => _MoreinfoState();
}

class _MoreinfoState extends State<Moreinfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 6, 49, 83),
        title: Text('About'),
      ),
      body: ListView(
        children: [
          Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Text(
                      'Quick Spot',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Vehicle Parking',
                      style: TextStyle(),
                    ),
                    Divider(height: 70, color: Colors.black87),
                    Text(
                      'About Quick Spot',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Quick Spot is a cutting-edge vehicle parking application designed to revolutionize the parking experience. It offers a wide range of features to make parking efficient, convenient, and stress-free for users. Whether you have a car, bus, truck, or bike, Quick Spot has you covered.',
                      style: TextStyle(),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Key Features:',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text('- Multi-floor parking for various vehicle types.'),
                    Text('- Real-time parking space availability updates.'),
                    Text('- Reservation system for guaranteed parking slots.'),
                    Text('- Secure and monitored parking facility with CCTV.'),
                    Text('- Automated entry/exit barriers for enhanced safety.'),
                    Text('- User-friendly interface for easy navigation.'),
                    Text('- Search and navigation to quickly locate your vehicle.'),
                    Text('- Flexible payment options including cards and mobile wallets.'),
                    Text('- Push notifications for timely updates and reminders.'),
                    Text('- Detailed analytics for parking facility owners.'),
                    SizedBox(height: 20),
                    Text(
                      'Why Choose Quick Spot?',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Quick Spot goes beyond traditional parking solutions by combining advanced technology with user-centric design. Enjoy a seamless parking experience with our intuitive app, ensuring you always find the perfect spot for your vehicle. Say goodbye to parking woes with Quick Spot!',
                      style: TextStyle(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
