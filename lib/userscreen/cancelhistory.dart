// ignore_for_file: prefer_const_constructors, unused_import, unnecessary_import, deprecated_member_use, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quickspot/adminpages/detailedbook.dart';
import 'package:quickspot/fuctions/cancelfunction.dart';
import 'package:quickspot/models/cancelation.dart';


class CancelationScreen extends StatefulWidget {
  const CancelationScreen({Key? key}) : super(key: key);

  @override
  State<CancelationScreen> createState() => _CancelationScreenState();
}

class _CancelationScreenState extends State<CancelationScreen> {
  List<Cancellation> listbooked = [];
  String? selectedFloor;
   late Box<Cancellation> orderBox;

  @override
  void initState() {
    super.initState();
    _openBox();
  }

  Future<void> _openBox() async {
    orderBox = await Hive.openBox<Cancellation>(cancels);
    setState(() {
      listbooked = orderBox.values.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 6, 49, 83),
        title: Text('Cancelation History'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: orderBox.listenable(),
              builder: (context, value, child) {
                return ListView.builder(
                  itemCount: listbooked.length,
                  itemBuilder: (context, index) {
                    final categorys = listbooked[index];
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Card(
                        child: ListTile(
                          title: Text(
                            (categorys.category == 'Floor1')
                                ? 'T${categorys.slotnumber}'
                                : (categorys.category == 'Floor2')
                                    ? 'B${categorys.slotnumber}'
                                    : (categorys.category == 'Floor3')
                                        ? 'C${categorys.slotnumber}'
                                        : 'M${categorys.slotnumber}',
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BookDetails(
                                     payment: listbooked[index].payment,
                                            category:
                                                listbooked[index].category,
                                            slotnumber:
                                                listbooked[index].slotnumber,
                                            ownername:
                                                listbooked[index].ownername,
                                            vehiclenum:
                                                listbooked[index].vehiclenum,
                                            model: 
                                                listbooked[index].model,
                                            license:
                                                listbooked[index].license,
                                            entreDate:
                                                listbooked[index].entreDate,
                                            exitDate:
                                                listbooked[index].exitDate,
                                            enterTime:
                                                listbooked[index].enterTime,
                                            exitTime:
                                                listbooked[index].exitTime,
                                  )));
                                 
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.white, backgroundColor: const Color.fromARGB(255, 67, 104, 135),
                                ),
                                child: Text('Details'),
                              ),
                              SizedBox(width: 10),
                              // TextButton(
                              //   onPressed: () {
                              //     showDialog(
                              //       context: context,
                              //       builder: (BuildContext context) {
                              //         return AlertDialog(
                              //           title: Text('Cancel Booking'),
                              //           content: Text('Do you want to cancel this booking?'),
                              //           actions: [
                              //             TextButton(
                              //               onPressed: () {
                              //                 Navigator.pop(context); 
                              //               },
                              //               child: Text('No'),
                              //             ),
                              //             TextButton(
                              //               onPressed: () {
                              //                 orderBox.deleteAt(index);
                              //               Cancellation cancel=Cancellation(category: listbooked[index].category.toString() , slotnumber: int.parse(listbooked[index].slotnumber.toString()), id: -1);
                              //                 listbooked.removeAt(index);

                              //                 Cancelfunction().cancelsave(cancel);
                              //                 setState(() {
                              //                 });

                              //                 Navigator.pop(context); 
                              //               },
                              //               child: Text('Yes'),
                              //             ),
                              //           ],
                              //         );
                              //       },
                              //     );
                              //   },
                              //   style: TextButton.styleFrom(
                              //     backgroundColor: Colors.red,
                              //     primary: Colors.white,
                              //   ),
                              //   child: Text('Cancel'),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
