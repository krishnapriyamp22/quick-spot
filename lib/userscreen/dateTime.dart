// ignore_for_file: prefer_final_fields, prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors, file_names, no_logic_in_create_state, body_might_complete_normally_nullable, avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:quickspot/models/vehicledetail.dart';
import 'package:quickspot/userscreen/payment.dart';

//import 'package:quick_spot/screens/userscreen/splash.dart';

class DateScreen extends StatefulWidget {
  DateScreen(
      {required this.vehicle,
      required this.selectedSlot,
      required this.categoryss});
  Vehicle vehicle;
  int selectedSlot;
  String categoryss;
  @override
  _DatetimeState createState() => _DatetimeState();
}

class _DatetimeState extends State<DateScreen> {
  DateTime? selectedDate;
  TimeOfDay? entryTime;
  TimeOfDay? exitTime;
  DateTime? exitDate;
  TextEditingController _dateController = TextEditingController();
  TextEditingController _entryTimeController = TextEditingController();
  TextEditingController _exitTimeController = TextEditingController();
  TextEditingController _exitDateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _dateController.text = '${selectedDate!.toLocal()}'.split(' ')[0];
      });
    }
  }

  Future<void> _selectTime(BuildContext context, bool isEntryTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isEntryTime
          ? entryTime ?? TimeOfDay.now()
          : exitTime ?? TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        if (isEntryTime) {
          entryTime = picked;
          _entryTimeController.text = picked.format(context);
        } else {
          exitTime = picked;
          _exitTimeController.text = picked.format(context);
        }
      });
    }
  }

  Future<void> _selectExitDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: exitDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != exitDate) {
      setState(() {
        exitDate = picked;
        _exitDateController.text = '${exitDate!.toLocal()}'.split(' ')[0];
      });
    }
  }

  String? _validateDates() {
    if (selectedDate != null && exitDate != null) {
      if (selectedDate!.isAfter(exitDate!)) {
        return 'Entry date must be before exit date';
      }
    }
    return null;
  }

  String? _validateTimes() {
    if (entryTime != null && exitTime != null && selectedDate != null) {
      final DateTime entryDateTime = DateTime(
          selectedDate!.year,
          selectedDate!.month,
          selectedDate!.day,
          entryTime!.hour,
          entryTime!.minute);
      final DateTime exitDateTime = DateTime(
          selectedDate!.year,
          selectedDate!.month,
          selectedDate!.day,
          exitTime!.hour,
          exitTime!.minute);

      if (entryDateTime.isAfter(exitDateTime)) {
        return 'Entry time must be before exit time';
      }

      if (entryDateTime.isAtSameMomentAs(exitDateTime)) {
        return 'Entry time and exit time cannot be the same';
      }
      
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    if (selectedDate != null) {
      _dateController.text = '${selectedDate!.toLocal()}'.split(' ')[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 6, 49, 83),
        title: Text('When?'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: _dateController,
                        readOnly: true,
                        onTap: () => _selectDate(context),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          labelText: 'Entry Date',
                          prefixIcon: Icon(Icons.calendar_today),
                          errorText: _validateDates(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'ple';
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: _exitDateController,
                        readOnly: true,
                        onTap: () => _selectExitDate(context),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          labelText: 'Exit Date',
                          prefixIcon: Icon(Icons.calendar_today),
                          errorText: _validateDates(),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: _entryTimeController,
                        readOnly: true,
                        onTap: () => _selectTime(context, true),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          labelText: 'Entry Time',
                          prefixIcon: Icon(Icons.access_time),
                          errorText: _validateTimes(),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: _exitTimeController,
                        readOnly: true,
                        onTap: () => _selectTime(context, false),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          labelText: 'Exit Time',
                          prefixIcon: Icon(Icons.access_time),
                          errorText: _validateTimes(),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_validateDates() == null &&
                            _validateTimes() == null) {
                          // Calculate payment based on time duration
                          int days = exitDate!.difference(selectedDate!).inDays;
                          int hours = exitTime!.hour - entryTime!.hour;
                          int minutes = exitTime!.minute - entryTime!.minute;
                          print(minutes);
                          int totalHours;
                          if (minutes >= 15) {
                            totalHours = days * 24 + hours + 1;
                          } else {
                            totalHours = days * 24 + hours;
                          }
                          print(totalHours);

                          // Set the fixed rate per hour
                          int ratePerHour = 100;

                          // Calculate the payment amount
                          int paymentAmount = totalHours > 0
                              ? (totalHours.ceil() * ratePerHour)
                              : ratePerHour;

                          // Validation passed, proceed to the next screen with payment information
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Payment(
                                paymentAmount: paymentAmount,
                                categorys: widget.categoryss,
                                enteryDate: selectedDate.toString(),
                                enteryTime: entryTime.toString(),
                                exitDate: exitDate.toString(),
                                exitTime: exitTime.toString(),
                                selectedslot: widget.selectedSlot,
                                vehicle: widget.vehicle,
                              ),
                            ),
                          );
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 8, 5, 50),
                        ),
                      ),
                      child: Text('DONE'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
