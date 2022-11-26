import 'package:cleanzo/widgets/AddressForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../controllers/addressController.dart';

class Scheduler extends StatefulWidget {
  const Scheduler({super.key});

  @override
  State<Scheduler> createState() => _SchedulerState();
}

class _SchedulerState extends State<Scheduler> {
  var addressController = Get.put(AddressController());

  void _addEntryModalSheet(BuildContext ctx) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: ctx,
        builder: (_) {
          return const SizedBox(
            child: AddressForm(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        height: 100,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.3),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(100),
            bottomRight: Radius.circular(100),
          ),
        ),
      ),
      Container(
          height: 200,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.3),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(100),
              bottomRight: Radius.circular(100),
            ),
          )),
      Column(children: [
        const SizedBox(
          height: 230,
        ),
        Container(
          margin: const EdgeInsets.only(left: 20),
          height: 30,
          width: double.infinity,
          child: const Text("Schedule Pickup",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700)),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          margin: const EdgeInsets.only(left: 20),
          alignment: Alignment.bottomLeft,
          child: const Text(
            "Saved Address:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          height: 220,
          width: double.infinity,
          child: Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      child: const Icon(
                    Icons.home,
                    size: 35,
                  )),
                  Container(
                    // margin: EdgeInsets.only(left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Home",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GetBuilder<AddressController>(
                            builder: (addressController) {
                          return SizedBox(
                            height: 110,
                            width: 150,
                            child: MediaQuery.removePadding(
                              context: context,
                              removeTop: true,
                              child: ListView(children: [
                                Text(
                                  "${addressController.address.name}\n${addressController.address.mobile}\n${addressController.address.address}\n${addressController.address.pincode}",
                                  style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ]),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            _addEntryModalSheet(context);
                          },
                          child: const Icon(
                            Icons.edit,
                            size: 35,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ])
    ]));
  }
}
