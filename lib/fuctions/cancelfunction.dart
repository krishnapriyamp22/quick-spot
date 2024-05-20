// ignore_for_file: unused_import, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quickspot/models/cancelation.dart';

ValueNotifier<List<Cancellation>>cancellist=ValueNotifier([]);
String cancels='cancel';

class Cancelfunction{
  Future<void>cancelsave(Cancellation value)async{
    final save =await Hive.openBox<Cancellation>(cancels);
    final id =await save.add(value);
    final data=save.get(id);
    await save.put(id, Cancellation(
    category: data!.category,
    slotnumber: data.slotnumber,
    ownername: data.ownername,
    vehiclenum: data.vehiclenum,
    model: data.model,
    license: data.license,
    entreDate: data.entreDate,
    exitDate: data.exitDate,
    enterTime: data.enterTime,
    exitTime: data.exitTime,
    payment: data.payment,
    id: id));
    getallcancel();
    
  }
  Future<void>getallcancel()async{
    final save=await Hive.openBox<Cancellation>(cancels);
    cancellist.value.clear();
    cancellist.value.addAll(save.values);
    cancellist.notifyListeners();
  }
  //  Future<void> deleteSlotByNumber(int slotNumber) async {
  //   final save = await Hive.openBox<Cancellation>('cancel');

  //   // Find the Cancellation object with the specified slotnumber
  //   final List<int> keysToRemove = [];
  //   for (final entry in save.toMap().entries) {
  //     if (entry.value.slotnumber == slotNumber) {
  //       keysToRemove.add(entry.key);
  //     }
  //   }

  //   // Delete the Cancellation objects with the specified slotnumber
  //   for (final key in keysToRemove) {
  //     await save.delete(key);
  //   }

  //   // Update the cancellist
  //   getallcancel();
  // }
}
