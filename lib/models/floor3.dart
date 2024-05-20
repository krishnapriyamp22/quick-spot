// ignore_for_file: depend_on_referenced_packages

import 'package:hive/hive.dart';
part 'floor3.g.dart';
@HiveType(typeId:7)
class Floor3 {
  @HiveField(0)
  String slotcount;
   @HiveField(1)
   int id;
  Floor3({required this.slotcount,required this.id});
} 