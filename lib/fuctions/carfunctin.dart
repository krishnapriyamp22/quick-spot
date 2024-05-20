// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, avoid_print, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quickspot/models/car.dart';

ValueNotifier<List<Car>>carlist=ValueNotifier([]);
String cardetail='car_box';

class Carfunction{
  Future<void>addcar(Car value)async{
    final carslot=await Hive.openBox<Car>(cardetail);
    final carowner=await carslot.add(value);
    final data  = carslot.get(carowner);
    await carslot.put(carowner, Car(carownername: data!.carownername,
    carnum: data.carnum,
    carmodel: data.carmodel,
    carlicense: data.carlicense, 
    id: data.id));
    print('add ');
    getallcar();
  }
  Future<void>getallcar()async{
    final carslot=await Hive.openBox<Car>('car_box');
    carlist.value.clear();
    carlist.value.addAll(carslot.values);
    carlist.notifyListeners();
  }
}