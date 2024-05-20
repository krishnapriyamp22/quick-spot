
// ignore_for_file: unnecessary_import, depend_on_referenced_packages, constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quickspot/models/booked.dart';
import 'package:quickspot/models/cancelation.dart';
import 'package:quickspot/models/login.dart';
//import 'package:quickspot/models/relive.dart';
import 'package:quickspot/models/slot.dart';
import 'package:quickspot/models/vehicledetail.dart';
import 'package:quickspot/screen_splash.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

const save_key = 'userlogin';
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
await Hive.initFlutter();
  //Hive.openBox<Relive>('relive');
  Hive.openBox<Slot>('slot');
  Hive.openBox<User>('login');
  // Hive.openBox<Slot>('vehicle_box');
  Hive.openBox<Booked>('booked');
  Hive.openBox<Cancellation>('cancel');
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(SlotAdapter());
  Hive.registerAdapter(VehicleAdapter());
  Hive.registerAdapter(BookedAdapter());
  Hive.registerAdapter(CancellationAdapter());
  //Hive.registerAdapter(ReliveAdapter());

 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
          ),
      home: ScreenSplash(),
    );
  }
}
