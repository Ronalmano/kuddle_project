import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kuddle_coding_test/pages/home_page.dart';
import 'package:kuddle_coding_test/pages/util.dart';

class GymClass extends StatefulWidget {
  // const GymClass({super.key});
  final String name;
  final Classes cgym;
  @override
  GymClass({
    required this.cgym,
    required this.name,
    super.key,
  });
  State<GymClass> createState() => _GymClassState();
}

class _GymClassState extends State<GymClass> {
  // List<String> cl = [];
  // List<String> wait = [];

  int cnt = 3;
  bool fl = true;
  @override
  void init() {
    Classes cgym;
    printcheck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Gym Class")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  if (cnt != 0) {
                    // Added to class
                    widget.cgym.cl.add(widget.name);
                    cnt--;
                    fl = true;
                  } else {
                    // Added to waiting list
                    widget.cgym.wait.add(widget.name);
                    fl = false;
                  }
                  printcheck();
                });
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  color: Colors.green,
                ),
                child: const Text(
                  "Join this Class",
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  removeName();
                });
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  color: Colors.green,
                ),
                child: const Text("Leave class"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget printcheck() {
    // Printing the names of the members of the class
    int n = widget.cgym.cl.length;
    for (int i = 0; i < n; i++) {
      log(widget.cgym.cl[i].toString());
    }
    log(n.toString());
    if (n >= 0 && n < 3) {
      return const Text("Added to the class");
    } else {
      return const Text("Added to waitng List");
    }
  }

  void removeName() {
    widget.cgym.cl.removeWhere((str) {
      return str == widget.name;
    });
    int n = widget.cgym.cl.length;
    if (n >= 3) {
      String temp = widget.cgym.wait[0];
      widget.cgym.cl.add(temp);
      widget.cgym.wait.removeWhere((str) {
        return str == temp;
      });
    }
  }
}
