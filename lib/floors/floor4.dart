// ignore_for_file: must_be_immutable, non_constant_identifier_names, override_on_non_overriding_member, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:quickspot/fuctions/slotfunction.dart';


class ScreenFLoor4 extends StatefulWidget {
   ScreenFLoor4({required this.isAdmin,super.key});
  bool isAdmin;
  @override
  State<ScreenFLoor4> createState() => _Floor1State();
}

class _Floor1State extends State<ScreenFLoor4> {

  Slotfunction slots = Slotfunction();

@override
InitState(){
super.initState();

}

  @override
  Widget build(BuildContext context) {
    slots.getallslots();
     final filteredstudentss = slotlist.value
          .where((slots) => slots.category  == 'Floor4')
          .toList();
      slotlist.value = filteredstudentss;
    return Scaffold(
       body: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       ChoiceChip(label: Text('floor 1'),
            //        selected: selectedfloor==1,
            //        onSelected: (selected){
            //         setState(() {
            //           selectedfloor =selected ?1:0;
            //         });
            //        },),
            //        SizedBox(width: 60,),
            //        ChoiceChip(label: Text('floor 2'),
            //        selected: selectedfloor==2,
            //        onSelected: (selected){
            //         setState(() {
            //           selectedfloor =selected ?1:0;
            //         });
            //        },),SizedBox(width: 60,),
            //        ChoiceChip(label: Text('floor 3'),
            //        selected: selectedfloor==3,
            //        onSelected: (selected){
            //         setState(() {
            //           selectedfloor =selected ?1:0;
            //         });
            //        },),
            //     ],
            
            //   ),
            // ),
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
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: ElevatedButton(onPressed: (){}, child: Text("PROCEED")),
            // )
          ],
        ),
         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
           floatingActionButton:(!widget.isAdmin)?  FloatingActionButton.extended(backgroundColor:const Color.fromARGB(255, 6, 49, 83),
        elevation: 10,
          onPressed: (){}, label:  Text("PROCEED")): null
    );
  }
}