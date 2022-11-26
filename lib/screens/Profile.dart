import 'package:cleanzo/screens/HomePage.dart';
import 'package:flutter/material.dart';

class profiles extends StatefulWidget {
  const profiles({Key? key}) : super(key: key);

  @override
  State<profiles> createState() => _profilesState();
}

class _profilesState extends State<profiles> {
  @override
  final textController = TextEditingController();
  int _bottomIndex = 2;
  //Keeps track of what the user is doing

  void _onBottomTap(int index) {
    setState(() {
      _bottomIndex = index;
      if (index == 0) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const MyHomePage(title: "Cleanzo");
        }));
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Edit Profile"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Column(children: [
        Container(
            child: CircleAvatar(
          radius: 70.0, //Needs to fix it later
        )),
        Container(
          alignment: Alignment.topLeft,
          width: double.infinity,
          height: 90.0,
          padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
          child: Column(
            children: [
              SizedBox(height: 5.0),
              TextFormField(
                controller: textController,
                decoration: InputDecoration(
                  label: Text("Username",
                      style:
                          TextStyle(fontSize: 22.0, color: Colors.blue[600])),
                ),
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp('r^[a-zA-Z0-9]+').hasMatch(value!)) {
                    return "Invalid UserName";
                  } else {
                    return null;
                  }
                },
              )
            ],
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          width: double.infinity,
          height: 90.0,
          padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
          child: Column(
            children: [
              SizedBox(height: 5.0),
              TextFormField(
                controller: textController,
                decoration: InputDecoration(
                  label: Text("Name",
                      style:
                          TextStyle(fontSize: 22.0, color: Colors.blue[600])),
                ),
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp('r^[a-zA-Z0-9]+').hasMatch(value!)) {
                    return "Invalid UserName";
                  } else {
                    return null;
                  }
                },
              )
            ],
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          width: double.infinity,
          height: 90.0,
          padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
          child: Column(
            children: [
              SizedBox(height: 5.0),
              TextFormField(
                controller: textController,
                decoration: InputDecoration(
                  label: Text("Email",
                      style:
                          TextStyle(fontSize: 22.0, color: Colors.blue[600])),
                ),
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp('r^[a-zA-Z0-9]+').hasMatch(value!)) {
                    return "Invalid UserName";
                  } else {
                    return null;
                  }
                },
              )
            ],
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          width: double.infinity,
          height: 90.0,
          padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
          child: Column(
            children: [
              SizedBox(height: 5.0),
              TextFormField(
                controller: textController,
                decoration: InputDecoration(
                  label: Text("Change Password",
                      style:
                          TextStyle(fontSize: 22.0, color: Colors.blue[600])),
                ),
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp('r^[a-zA-Z0-9]+').hasMatch(value!)) {
                    return "Invalid UserName";
                  } else {
                    return null;
                  }
                },
              )
            ],
          ),
        )
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
