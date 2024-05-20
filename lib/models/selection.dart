// ignore_for_file: depend_on_referenced_packages

import 'package:hive/hive.dart';
part 'selection.g.dart';
@HiveType(typeId:12)
class Selection {
  @HiveField(0)
  String categorey;
  @HiveField(1)
  int index;
  @HiveField(2)
  bool isBooked;
  @HiveField(3)
  int ? id;


Selection({required this.categorey,required this.index,required this.isBooked ,required this.id});

}