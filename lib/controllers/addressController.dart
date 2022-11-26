import 'package:cleanzo/modals/customer_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AddressController extends GetxController {
  CustomerAddress address =
      CustomerAddress("Adil", 99219265756, 123, "Lane 3", 485);

  String baseUrl = "http://amilpa.pythonanywhere.com/collect/";

  Future<List> getAddress() async {
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("Server Error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  void onInit() {
    super.onInit();
    print("INit state called");
    setAddress();
  }

  void setAddress() async {
    var address = await getAddress();
    print(address[0]["id"]);
  }

  void updateAddress(CustomerAddress recievedAddress) {
    //API CALL
    address = recievedAddress;
    update();
  }
}
