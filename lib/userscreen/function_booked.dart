// ignore_for_file: unused_import, avoid_print, non_constant_identifier_names, depend_on_referenced_packages

import 'package:hive/hive.dart';
import 'package:quickspot/models/booked.dart';

class BookedHelper{
   Future<void>addBooked(Booked value)async{
    final Vh= await Hive.openBox<Booked>('booked');
    final id =await Vh.add(value);
    final data= Vh.get(id);
    await Vh.put( id ,Booked(category: data!.category,entreDate: data.entreDate,exitDate: data.exitDate,exitTime: data.exitTime,license: data.license,
    model: data.model,ownername: data.ownername,slotnumber: data.slotnumber,vehiclenum: data.vehiclenum,payment: data.payment,
    enterTime: data.enterTime,

    id:id

    
    ));
    print('add succesfully');
  }
}