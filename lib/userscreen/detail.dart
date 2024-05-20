// ignore_for_file: use_build_context_synchronously, unused_import, duplicate_import, must_be_immutable, unused_local_variable, unused_element, non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quickspot/custom%20widgets/screencustom/Udetail.dart';
import 'package:quickspot/fuctions/vehiclefunctin.dart';
import 'package:quickspot/models/vehicledetail.dart';
import 'package:quickspot/userscreen/userslot.dart';




class Detail extends StatefulWidget {
  Detail({super.key, required this.floorIs,this.title});
  String? title;
   String ? floorIs;
  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  final formkeyv = GlobalKey<FormState>();
  TextEditingController ownernameController = TextEditingController();
  TextEditingController vehiclenumController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController licenseController = TextEditingController();

   void _submitdetail() async{
    if(formkeyv.currentState!.validate()){
      formkeyv.currentState!.save();
    }
    String enteredownername =ownernameController.text;
    String enteredvehiclenum =vehiclenumController.text;
    String enteredmodel =modelController.text;
    String enteredlicense =licenseController.text;
   }
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    double screenWidth = MediaQuery.of(context).size.width;
    double ScreenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.title}"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 6, 49, 83),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.10),
            child: Form(
              key: formkeyv,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                
                children: [
                  SizedBox(height: ScreenHeight * 0.10),
                  textformfield1( ownernameController: ownernameController, ),
                  SizedBox(height: ScreenHeight * 0.02),
                  textformfield(vehiclenumController: vehiclenumController),
                  SizedBox(height: ScreenHeight * 0.02,),
                  textformfield3(modelController: modelController),
                  SizedBox(height: ScreenHeight * 0.02,),
                  textformfield4(licenseController: licenseController),
                  SizedBox(height: ScreenHeight * 0.04,),
                  ElevatedButton(style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all( const Color.fromARGB(255, 6, 49, 83),)
                  ),
                    
                    onPressed: () async {
                      if (formkeyv.currentState!.validate()) {
                        Vehicle owner = Vehicle(
                          ownername: ownernameController.text.trim(),
                          vehiclenum: vehiclenumController.text.trim(),
                          model: modelController.text.trim(),
                          license: licenseController.text.trim(),
                          id: -1,
                        );
                        await Vehiclefunction().addvehicle(owner);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Userslot(
                              floorIs: widget.floorIs!,
                              vehicle: owner),
                          ),
                        );
                      }
                    },
                    child: Text('DONE'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

