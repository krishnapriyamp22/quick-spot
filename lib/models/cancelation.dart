// cancellation.dart

// ignore_for_file: depend_on_referenced_packages

import 'package:hive/hive.dart';
part 'cancelation.g.dart';

@HiveType(typeId: 15)
class Cancellation  {
  @HiveField(0)
  String category;
 @HiveField(1)
  int slotnumber;
  @HiveField(2)
  String ownername;
  @HiveField(3)
  String vehiclenum;
  @HiveField(4)
  String model;
  @HiveField(5)
  String license;
  @HiveField(6)
  String entreDate;
   @HiveField(7)
  String exitDate;
  @HiveField(8)
  String enterTime;
  @HiveField(9)
  String exitTime;
  @HiveField(10)
  String payment;
  @HiveField(11)
  int id;
  
 

Cancellation({
    required this.category,
    required this.slotnumber,
    required this.ownername,
    required this.vehiclenum,
    required this.model,
    required this.license,
    required this.entreDate,
     required this.exitDate,
     required this.enterTime,
     required this.exitTime,
     required this.payment,


    required this.id
    
  });
}

