// ignore_for_file: depend_on_referenced_packages

import 'package:hive/hive.dart';
part 'car.g.dart';
@HiveType(typeId:4)
class Car {
  @HiveField(0)
  String carownername;
  @HiveField(1)
  String carnum;
  @HiveField(2)
  String carmodel;
  @HiveField(3)
  String carlicense;
  @HiveField(4)
  int? id;

  Car({required this.carownername,required this.carnum,required this.carmodel,required this.carlicense,required this.id});
  
}