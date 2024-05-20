// ignore_for_file: prefer_const_constructors, unnecessary_import, unnecessary_cast, deprecated_member_use, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quickspot/adminpages/detailedbook.dart';
import 'package:quickspot/models/booked.dart';


class BookingDetail extends StatefulWidget {
  const BookingDetail({Key? key}) : super(key: key);

  @override
  State<BookingDetail> createState() => _BookingDetailState();
}
class _BookingDetailState extends State<BookingDetail> {
  List<Booked> listbooked = [];
  String? selectedFloor;
  late Box<Booked> orderBox;

  @override
  void initState() {
    super.initState();
    _openBox();
  }
Future<void> _openBox() async {
    orderBox = await Hive.openBox<Booked>('booked');
    setState(() {
      listbooked = orderBox.values.toList();
    });
  }
 @override
  Widget build(BuildContext context) {
    List<String> floorItems = ['Floor1', 'Floor2', 'Floor3', 'Floor4'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 6, 49, 83),
        title: Text('Booking details'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(30),
            child: DropdownButtonFormField(
              value: selectedFloor,
              hint: Text('Select Floor'),
              items: floorItems.map((floor) {
                return DropdownMenuItem(
                  value: floor,
                  child: Text(floor),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedFloor = value as String?;
                  filterBookedByCategory(value!);
                });
              },
            ),
          ),
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
                          trailing: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BookDetails(
                                        payment: listbooked[index].payment,
                                            category:
                                                listbooked[index].category ?? "",
                                            slotnumber:
                                                listbooked[index].slotnumber ?? 0,
                                            ownername:
                                                listbooked[index].ownername ?? "",
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
                              foregroundColor: Colors.white, backgroundColor:
                                  const Color.fromARGB(255, 67, 104, 135),
                            ),
                            child: Text('Details'),
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
 void filterBookedByCategory(String category) {
    if (category == 'All Floors') {
      setState(() {
        listbooked = orderBox.values.toList();
      });
    } else {
      final filteredBooked = orderBox.values
          .where((booking) => booking.category == category)
          .toList();
      setState(() {
        listbooked = filteredBooked;
      });
    }
  }
}
