

// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:hive/hive.dart';

import '../models/booked.dart';
late Box<Booked>box1;
late Box<Booked>box2;

Future<void> openBoxes()async{
  box1=await Hive.openBox<Booked>('booked');
 box2=await Hive.openBox<Booked>('Relivedetail');
await syncData();
}

Future<void>syncData()async{
  await box1.clear();
   await box2.clear();

   final List<Booked>dataFromBox1=box1.values.toList();
   for(final data in dataFromBox1){
    box2.add(data);
   }
   final List<Booked>dataFromBox2=box2.values.toList();
   for(final data in dataFromBox2){
    box1.add(data);
   }
}

Future<void> addToBox1(Booked data)async{
await box1.add(data);
await syncData();
}
Future<void>addToBox2(Booked data)async{
  await box2.add(data);
  await syncData();
 print(box2.values);
}
