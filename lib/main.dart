import 'package:cleanzo/screens/Schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cleanzo',
      theme: ThemeData(
        appBarTheme:
            const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.dark),
        primaryColor: const Color.fromARGB(255, 92, 198, 240),
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Cleanzo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _bottomIndex = 0;

  void _onBottomTap(int index) {
    print("Bottom Nav");
    setState(() {
      _bottomIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   systemOverlayStyle:
      //       const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   title: Text(widget.title,
      //       style: const TextStyle(
      //           color: Colors.black,
      //           fontFamily: 'Poppins',
      //           fontWeight: FontWeight.w700)),
      // ),
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
        Column(
          children: [
            const SizedBox(
              height: 55,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              height: 100,
              width: double.infinity,
              child: Text(widget.title,
                  style: const TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700)),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              child: const Image(
                  image: AssetImage('assets/images/HomePage/Agent.png')),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(20),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(8),
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 92, 198, 240)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctxt) => const Scheduler()));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Container(
                              height: 40,
                              child: const Image(
                                  image: AssetImage(
                                      "assets/images/HomePage/pickup.png")),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Schedule Pickup",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      )),
                ),
                Container(
                    margin: const EdgeInsets.all(20),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(8),
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 92, 198, 240)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ))),
                        onPressed: () {},
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Container(
                                  height: 40,
                                  child: const Icon(Icons.pin_drop,
                                      size: 35, color: Colors.black)),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Collection Centre",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ))),
              ],
            ),
            Container(
                margin: const EdgeInsets.all(20),
                child: ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(8),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 92, 198, 240)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ))),
                    onPressed: () {},
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Container(
                            height: 40,
                            child: const Image(
                                image: AssetImage(
                                    'assets/images/HomePage/segregate.png')),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Waste Segregation",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ))),
          ],
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: "Upcoming Pickup"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
        ],
        selectedItemColor: const Color.fromARGB(255, 92, 198, 240),
        currentIndex: _bottomIndex,
        onTap: _onBottomTap,
      ),
    );
  }
}
