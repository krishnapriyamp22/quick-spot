// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:quickspot/custom%20widgets/screencustom/Aaddslot.dart';
import 'package:quickspot/fuctions/slotfunction.dart';
import 'package:quickspot/models/slot.dart';


class AddSlot extends StatefulWidget {
  const AddSlot({Key? key}) : super(key: key);

  @override
  State<AddSlot> createState() => _AddSlotState();
}

class _AddSlotState extends State<AddSlot> {
 // String dropdownValue = 'car';
  final formkey = GlobalKey<FormState>();
  var items = ['Floor1', 'Floor2', 'Floor3', 'Floor4'];
  late String _category;
  Slotfunction slot = Slotfunction();
  TextEditingController slottnumbercontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _category = items.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: const Color.fromARGB(255, 6, 49, 83),
        title: const Text('Add Slot'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField<String>(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  value: _category,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 15,
                    ),
                    fillColor: Color(0xABFFFEFE),
                    labelText: 'Category',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  items: items.map((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _category = value!;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Select a category';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Aaddslot(slottnumbercontroller: slottnumbercontroller),
                SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(const Color.fromARGB(255, 6, 49, 83)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () async {
                    if (formkey.currentState!.validate()) {
                      formkey.currentState!.save();

                      _addSlot();
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text('Add Slot'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _addSlot() async {
    final slotNumber = slottnumbercontroller.text;
    final category1 = _category;
    final leng=int.parse(slotNumber);

for(int i=0;i<leng;i++){
  print(i);
   final details = Slot(
    id: -1,
    slotnumber: i.toString(), 
    category: category1);
    slot.slotsave(details);
}
    
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Slot added successfully.')),
    );
  }
}

