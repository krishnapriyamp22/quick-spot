// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, non_constant_identifier_names, avoid_print, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quickspot/models/login.dart';

ValueNotifier<List<User>>userlist=ValueNotifier([]);
String users='login';


class Userfunction{
    Future<void>loginsave(User value)async{
      final Save = await Hive.openBox<User>(users);
      final  id =await Save.add(value);
      final data=Save.get(id);
      await Save.put(id, User(username: data!.username, 
      email: data.email,
      mobile: data.mobile,
      password: data.password, 
      confirmpass: data.confirmpass,
      id: id, 
       ));
      print('add succesfully');
      getallvalue();
    }
    Future<void>getallvalue()async{
      final save=await Hive.openBox<User>('login');
      userlist.value.clear();
      userlist.value.addAll(save.values);
      userlist.notifyListeners();
    }
}

