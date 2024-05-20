// import 'package:bitebox/user/whishlist/fav_screen.dart';
// import 'package:bitebox/user/home_screen.dart';
// import 'package:bitebox/user/order_screens/orders_screen.dart';
// import 'package:bitebox/user/accountpage/account_screen.dart';
// ignore_for_file: unused_import, prefer_const_constructors, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quickspot/account.dart';
import 'package:quickspot/userscreen/bookingdetail.dart';
import 'package:quickspot/userscreen/vehicletype.dart';


class HomesScreenPage extends StatefulWidget {
  const HomesScreenPage({super.key});

  @override
  State<HomesScreenPage> createState() => _HomesScreenPageState();
}

class _HomesScreenPageState extends State<HomesScreenPage> {
  @override
 void initState() {
   
    super.initState();
  }
  
  int indexNum = 0;
  List tabWidgets = [
    Vehicletype(),
    BookingListUser(),
    
     Account()
     
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: 
        BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    // color: Color.fromARGB(255, 55, 57, 58),
                  ),
                  label: "Home",
                  backgroundColor: Color.fromARGB(255, 253, 252, 252)),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.book,
                    // color: Color.fromARGB(255, 55, 57, 58),
                  ),
                  label: "Booking",
                  backgroundColor: Color.fromARGB(255, 248, 250, 252)),
             
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_2_outlined,
                    // color: Color.fromARGB(255, 55, 57, 58),
                  ),
                  label: "Account",
                  backgroundColor: Color.fromARGB(255, 241, 241, 241)),
            ],
            iconSize: 30,
            showUnselectedLabels: true,
            currentIndex: indexNum,
            unselectedItemColor: Color.fromARGB(255, 0, 0, 0),
            selectedItemColor: Color.fromARGB(255, 6, 47, 226),
            onTap: (int index) {
              setState(() {
                indexNum = index;
              });
            }),
        body: Center(
          child: tabWidgets.elementAt(indexNum),
        ));
  }

  // ignore: non_constant_identifier_names
}