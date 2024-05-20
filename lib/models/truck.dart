// ignore_for_file: depend_on_referenced_packages

import 'package:hive/hive.dart';
part 'truck.g.dart';
@HiveType(typeId:11)
class Truck {
  @HiveField(0)
  String truckownername;
  @HiveField(1)
  String trucknum;
  @HiveField(2)
  String truckmodel;
  @HiveField(3)
  String trucklicense;
  @HiveField(4)
  int? id;

  Truck({required this.truckownername,required this.trucknum,required this.truckmodel,required this.trucklicense,required this.id});
  
}