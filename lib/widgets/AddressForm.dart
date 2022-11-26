import 'dart:ffi';
import 'package:get/get.dart';
import '../controllers/addressController.dart';
import 'package:cleanzo/modals/customer_address.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class AddressForm extends StatefulWidget {
  const AddressForm({super.key});
  static final _formKey = GlobalKey<FormState>();
  @override
  State<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  late String prevTitle;
  AddressController address = Get.put(AddressController());
  final controller = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  //titlecontroller is made a texteditingcontroller , that will never change but its properties like .text can change
  bool flag = false;

  DateTime selectedDate = DateTime.now();

  _validateAmount() {
    if (AddressForm._formKey.currentState!.validate()) {
      final newEntry = CustomerAddress(
          controller[0].text,
          int.parse(controller[1].text),
          int.parse(controller[2].text),
          controller[3].text,
          int.parse(controller[4].text));
      address.updateAddress(newEntry); //Calls addEntry from widget class above
      Navigator.of(context).pop(); //Close Modalsheet after entry
    }
  }

  // datePicker() async {
  //   DateTime? pickeDate = await showDatePicker(
  //       context: context,
  //       initialDate: DateTime.now(),
  //       firstDate: DateTime(2019),
  //       lastDate: DateTime.now());
  //   if (pickeDate != null) {
  //     //On cancel null is recieved
  //     setState(() {
  //       selectedDate = pickeDate;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    if (!flag) {
      //flag for running once only
      flag = true;
      controller[0].text = address.address.name!;
      controller[1].text = "${address.address.mobile}";
      controller[2].text = "${address.address.pincode}";
      controller[3].text = address.address.address!;
      controller[4].text = "${address.address.houseno}";
    }

    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      margin: const EdgeInsets.fromLTRB(11, 0, 11, 0),
      child: Container(
        padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
        child: Form(
          key: AddressForm._formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  validator: ((value) {
                    try {
                      if (value == "") {
                        return "Enter name";
                      } else {
                        return null;
                      }
                    } on FormatException {
                      return "Enter a valid";
                    }
                  }),
                  decoration: const InputDecoration(labelText: "Name"),
                  controller: controller[0],
                  onFieldSubmitted: (_) => _validateAmount(),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  validator: ((value) {
                    try {
                      double value1 = double.parse(value!);
                      if (value1 <= 1000000000) {
                        return "Enter a valid number";
                      }
                      return null;
                    } on FormatException {
                      return "Enter a valid number";
                    }
                  }),
                  decoration: const InputDecoration(
                    labelText: "Mobile",
                  ),
                  controller: controller[1],
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (_) => _validateAmount(),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  validator: ((value) {
                    try {
                      double value1 = double.parse(value!);
                      if (value1 <= 100000) {
                        return "Enter a valid pincode";
                      }
                      return null;
                    } on FormatException {
                      return "Enter a valid pincode";
                    }
                  }),
                  decoration: const InputDecoration(
                    labelText: "Pincode",
                  ),
                  controller: controller[2],
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (_) => _validateAmount(),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  validator: ((value) {
                    try {
                      if (value == "") {
                        return "Enter Address";
                      } else {
                        return null;
                      }
                    } on FormatException {
                      return "Enter a valid Address";
                    }
                  }),
                  decoration: const InputDecoration(labelText: "Address"),
                  controller: controller[3],
                  onFieldSubmitted: (_) => _validateAmount(),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  validator: ((value) {
                    try {
                      double value1 = double.parse(value!);
                      if (value1 <= 0) {
                        return "Enter a valid House No";
                      }
                      return null;
                    } on FormatException {
                      return "Enter a valid House No";
                    }
                  }),
                  decoration: const InputDecoration(
                    labelText: "House no.",
                  ),
                  controller: controller[4],
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (_) => _validateAmount(),
                ),
              ),
              ElevatedButton(
                  onPressed: _validateAmount, child: const Text("Edit Entry"))
            ],
          ),
        ),
      ),
    );
  }
}
