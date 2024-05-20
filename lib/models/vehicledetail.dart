// ignore_for_file: empty_constructor_bodies, depend_on_referenced_packages

import 'package:hive/hive.dart';
part 'vehicledetail.g.dart';
@HiveType(typeId:3)
class Vehicle
{
@HiveField(0)
  String ownername;
  @HiveField(1)
  String vehiclenum;
  @HiveField(2)
  String model;
  @HiveField(3)
  String license;
  @HiveField(4)
  int? id;

  Vehicle({required this.ownername,required this.vehiclenum,required this.model,required this.license,required this.id});

}