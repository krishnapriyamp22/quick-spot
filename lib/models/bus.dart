// ignore_for_file: depend_on_referenced_packages

import 'package:hive/hive.dart';
part 'bus.g.dart';
@HiveType(typeId:10)
class Bus {
  @HiveField(0)
  String busownername;
  @HiveField(1)
  String busnum;
  @HiveField(2)
  String busmodel;
  @HiveField(3)
  String buslicense;
  @HiveField(4)
  int? id;

  Bus({required this.busownername,required this.busnum,required this.busmodel,required this.buslicense,required this.id});
  
}