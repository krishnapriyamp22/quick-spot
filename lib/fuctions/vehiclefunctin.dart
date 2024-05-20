// ignore_for_file: duplicate_import, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, non_constant_identifier_names, avoid_print, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quickspot/models/vehicledetail.dart';

ValueNotifier<List<Vehicle>>vehiclelist=ValueNotifier([]);
String vehicledetail='vehicle_box';

class Vehiclefunction{
  Future<void>addvehicle(Vehicle value)async{
    final Vh= await Hive.openBox<Vehicle>(vehicledetail);
    final ownername =await Vh.add(value);
    final data= Vh.get(ownername);
    await Vh.put( ownername ,Vehicle (ownername:data!.ownername,
    vehiclenum:data.vehiclenum,
    model:data.model,
    license:data.license,
    id:data.id

    
    ));
    print('add succesfully');
    getallvehicle();
  }
  Future<void>getallvehicle()async{
    final vh =await Hive.openBox<Vehicle>('vehicle_box');
    vehiclelist.value.clear();
    vehiclelist.value.addAll(vh.values);
    vehiclelist.notifyListeners();
  }
}