// ignore_for_file: non_constant_identifier_names, override_on_non_overriding_member, sized_box_for_whitespace, prefer_const_constructors, avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:quickspot/fuctions/slotfunction.dart';


class ScreenFloor2 extends StatefulWidget {
   ScreenFloor2({required this.isAdmin,super.key});
   bool isAdmin;
  @override
  State<ScreenFloor2> createState() => _ScreenFLoor2State();
}

class _ScreenFLoor2State extends State<ScreenFloor2> {

  Slotfunction slots = Slotfunction();

@override
InitState(){
super.initState();
slots.getallslots();
}

  @override
  Widget build(BuildContext context) {
    slots.getallslots();
     final filteredstudentss = slotlist.value
          .where((student) => student.category  == 'Floor2')
          .toList();
      slotlist.value = filteredstudentss;
      print(slotlist.value);
    return Scaffold(
       body: Column(
          children: [
          
            Container(
              height: 670,
              width: 500,
              // color: Colors.red,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GridView.builder(
                    itemCount: slotlist.value.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 6), 
                    itemBuilder: (BuildContext context,index){
                      return Container(
                        height: 20,width: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey,
                        ),
                      );
                  
                    }),
                ),
              ),
            ),
           
          ],
        ),
         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
           floatingActionButton:(!widget.isAdmin)?  FloatingActionButton.extended(backgroundColor:const Color.fromARGB(255, 6, 49, 83),
        elevation: 10,
          onPressed: (){}, label:  Text("PROCEED")): null
    );
  }
}