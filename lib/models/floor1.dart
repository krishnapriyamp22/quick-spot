// ignore_for_file: depend_on_referenced_packages

import 'package:hive/hive.dart';
part 'floor1.g.dart';
@HiveType(typeId:5)
class Floor1 {
  @HiveField(0)
    String slotcount;
    @HiveField(1)
    int id;
  Floor1({required this.slotcount,required this.id});

  
}