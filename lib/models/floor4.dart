// ignore_for_file: depend_on_referenced_packages

import 'package:hive/hive.dart';
part 'floor4.g.dart';
@HiveType(typeId:8)
class Floor4 {
  @HiveField(0)
  String slotcount;
   @HiveField(1)
   int id;
  Floor4({required this.slotcount,required this.id});
} 