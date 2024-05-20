// Import statements...

// ignore_for_file: prefer_const_constructors, avoid_print, deprecated_member_use, prefer_final_fields, must_be_immutable, unused_field, unused_local_variable

import 'package:flutter/material.dart';
import 'package:quickspot/models/booked.dart';
import 'package:quickspot/models/vehicledetail.dart';
import 'package:quickspot/userscreen/function_booked.dart';
import 'package:quickspot/userscreen/paymentsucess.dart';


class Payment extends StatefulWidget {
  Payment(
      {Key? key,
      required this.paymentAmount,
      required this.categorys,
      required this.enteryDate,
      required this.enteryTime,
      required this.exitDate,
      required this.exitTime,
      required this.selectedslot,
      required this.vehicle})
      : super(key: key);
  Vehicle vehicle;
  int selectedslot;
  String categorys;
  String enteryDate;
  String enteryTime;
  String exitDate;
  String exitTime;
  final int paymentAmount;

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  TextEditingController _paymentController = TextEditingController();
  String _selectedPaymentMethod = 'Cash on Delivery';

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 6, 49, 83),
        title: Text('Payment Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Card(
                  elevation: 4,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    // width: screenWidth * 0.8,
                    child: Column(
                      children: [
                        Text(
                          'Payment Amount:',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 53, 176, 96),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '₹ ${widget.paymentAmount}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
//                        ElevatedButton(
//   onPressed: () async{
//     BookedHelper bhelp=BookedHelper();
//         Booked book=Booked(category: widget.categorys, slotnumber: widget.selectedslot, id: -1, ownername: widget.vehicle.ownername, license: widget.vehicle.license, vehiclenum: widget.vehicle.vehiclenum, model: widget.vehicle.model, entreDate: widget.enteryDate, enterTime: widget.enteryTime, exitDate: widget.exitDate, exitTime: widget.exitTime);
//      bhelp.addBooked(book);
//      print(book);
//      print('Add succesfully');
//   },
//   style: ElevatedButton.styleFrom(
//     primary: Color.fromARGB(255, 45, 46, 47), // Set your preferred color
//   ),
//   child: Text('Done'),
// ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.10),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(10.0), // Adjust the value as needed
                child: Container(
                  color: Color.fromARGB(255, 6, 49, 83),
                  padding: EdgeInsets.all(20),
                  child: Text(
                    '''instruction: 

* For 1 hour payment is ₹100 even if you leave before that, you have to pay  ₹100

                                  ....
''',
                    style: TextStyle(
                      fontSize: 15,
                      //fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.20),
            ElevatedButton(
              onPressed: () async {
                BookedHelper bhelp = BookedHelper();
                Booked book = Booked(
                  payment: widget.paymentAmount.toString(),
                    category: widget.categorys,
                    slotnumber: widget.selectedslot,
                    id: -1,
                    ownername: widget.vehicle.ownername,
                    license: widget.vehicle.license,
                    vehiclenum: widget.vehicle.vehiclenum,
                    model: widget.vehicle.model,
                    entreDate: widget.enteryDate,
                    enterTime: widget.enteryTime,
                    exitDate: widget.exitDate,
                    exitTime: widget.exitTime,);
                bhelp.addBooked(book);
                print(widget.vehicle.ownername);
                print('Add succesfully');
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentSuccess()));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(
                      255, 44, 89, 135) // Set your preferred color
                  ),
              child: Text('Book Slot'),
            ),
          ],
        ),
      ),
    );
  }
}
