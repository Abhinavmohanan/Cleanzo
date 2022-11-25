import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Scheduler extends StatefulWidget {
  const Scheduler({super.key});

  @override
  State<Scheduler> createState() => _SchedulerState();
}

class _SchedulerState extends State<Scheduler> {
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
          )),
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
          height: 55,
        ),
        Container(
          margin: const EdgeInsets.only(left: 20),
          height: 100,
          width: double.infinity,
          child: const Text("Schedule Pickup",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700)),
        ),
        const SizedBox(
          height: 20,
        ),
      ])
    ]));
  }
}
