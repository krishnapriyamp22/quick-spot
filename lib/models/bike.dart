// ignore_for_file: depend_on_referenced_packages

import 'package:hive/hive.dart';
part 'bike.g.dart';
@HiveType(typeId:9)
class Bike {
  @HiveField(0)
  String bikeownername;
  @HiveField(1)
  String bikenum;
  @HiveField(2)
  String bikemodel;
  @HiveField(3)
  String bikelicense;
  @HiveField(4)
  int? id;

  Bike({required this.bikeownername,required this.bikenum,required this.bikemodel,required this.bikelicense,required this.id});
  
}