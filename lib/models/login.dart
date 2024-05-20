// ignore_for_file: depend_on_referenced_packages

import 'package:hive/hive.dart';
part 'login.g.dart';

// ignore: empty_constructor_bodies
@HiveType(typeId:1)

class  User{
  @HiveField(0)
  String username;
  @HiveField(1)
  String email;
  @HiveField(2)
  String mobile;
  @HiveField(3)
  String password;
  @HiveField(4)
  String confirmpass;
  @HiveField(5)
  int ? id;
  

  User( {required this.username,required this.email,required this.mobile,required this.password,required this.id,required this.confirmpass });

  get key => null;
}

