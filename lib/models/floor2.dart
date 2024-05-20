// ignore_for_file: depend_on_referenced_packages

import 'package:hive/hive.dart';
part 'floor2.g.dart';
@HiveType(typeId:6)
class Floor2 {
  @HiveField(0)
  String slotcount;
   @HiveField(1)
   int id;
  Floor2({required this.slotcount,required this.id});
} 