// ignore_for_file: depend_on_referenced_packages

import 'package:hive/hive.dart';
part 'slot.g.dart';
@HiveType(typeId:2)

class Slot{
  @HiveField(0)
  String ? category ;
  @HiveField(1)
  String slotnumber;
  @HiveField(2)
  int  id;

  Slot({required this.category ,required this.slotnumber,required this.id});
}

