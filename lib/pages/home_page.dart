import 'package:flutter/material.dart';
import 'package:kuddle_coding_test/pages/dance.dart';
import 'package:kuddle_coding_test/pages/gym.dart';
import 'package:kuddle_coding_test/pages/util.dart';
import 'package:kuddle_coding_test/pages/yoga.dart';

class HomePage extends StatefulWidget {
  // const HomePage({super.key});
  final String name;
  final Classes cgym;
  final Classes cdance;
  final Classes cyoga;
  @override
  HomePage(
      {required this.cdance,
      required this.cgym,
      required this.cyoga,
      required this.name,
      super.key});
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> gymcl = [];
  List<String> dance = [];
  List<String> yoga = [];
  List<String> gwait = [];
  List<String> dwait = [];
  List<String> ywait = [];
  int gc = 3;
  int yc = 3;
  int dc = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => YogaClass(
                                name: widget.name,
                                cyoga: widget.cyoga,
                              )));
                });
              },
              child: Container(
                child: Text("Yoga"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                bool fl;
                if (gc != 0) {
                  // Added class
                  gymcl.add(widget.name);
                  fl = true;
                  gc--;
                } else {
                  // Added to waiting list
                  gwait.add(widget.name);
                  fl = false;
                }
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => GymClass(
                              name: widget.name,
                              cgym: widget.cgym,
                            )));
              },
              child: Container(
                child: Text("Gym"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => DanceClass(
                              name: widget.name,
                              cdance: widget.cdance,
                            )));
              },
              child: Container(
                child: Text("dance"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
