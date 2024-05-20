

// ignore_for_file: prefer_const_constructors, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quickspot/models/slot.dart';

ValueNotifier<List<Slot>>slotlist=ValueNotifier([]);
String slots='slot';//representing the box name

class Slotfunction{ 
  Future<void>slotsave(Slot value)async{
    final save= await Hive.openBox<Slot>(slots);
    final id =await save.add(value);
    final data=save.get(id);
    await save.put(id, Slot(
      category: data!.category,
      slotnumber:  data.slotnumber,
      id:  id
      ));
       getallslots();
  }
  Future<void>getallslots()async{
    final save=await Hive.openBox<Slot>(slots);
    slotlist.value.clear();
    slotlist.value.addAll(save.values);
    slotlist.notifyListeners();
  }
 Future<void> deleteslots(context, int id) async {
  final box = await Hive.openBox<Slot>('slot'); // Use the same box name 'slots'
  
  await box.delete(id);
  getallslots();
}
//  void removecart(BuildContext context, int? id) {
//   showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Remove slot'),
//           content: Text('Do you want to remove'),
//           actions: [
//             ElevatedButton(
//                 onPressed: () {
//                   deleteslots( context,id!);
//                 },
//                 child: Text('Yes')),
//             ElevatedButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text('No'))
//           ],
//         );
//       });
// }

}