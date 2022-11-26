import 'package:cleanzo/controllers/login_controller.dart';
import 'package:cleanzo/screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Obx(() {
      if (controller.googleAccount.value == null) {
        return GoogleSignIn();
      } else {
        return MyHomePage(title: "Cleanzo");
      }
    })));
  }

  Container GoogleSignIn() {
    return Container(
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(10),
            foregroundColor: MaterialStateProperty.all(Colors.black),
            backgroundColor: MaterialStateProperty.all(Colors.white)),
        child: Container(
          width: 150,
          child: Row(
            children: const [
              Icon(Icons.abc),
              Text("Sign In with Google"),
            ],
          ),
        ),
        onPressed: () {
          controller.login();
        },
      ),
    );
  }
}
