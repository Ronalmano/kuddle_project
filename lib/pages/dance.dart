import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kuddle_coding_test/pages/home_page.dart';
import 'package:kuddle_coding_test/pages/util.dart';

class DanceClass extends StatefulWidget {
  // const DanceClass({super.key});
  final String name;
  final Classes cdance;
  @override
  DanceClass({
    required this.cdance,
    required this.name,
    super.key,
  });
  State<DanceClass> createState() => _GymClassState();
}

class _GymClassState extends State<DanceClass> {
  // List<String> cl = [];
  // List<String> wait = [];

  int cnt = 3;
  bool fl = true;
  @override
  void init() {
    Classes cdance;
    printcheck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  if (cnt != 0) {
                    // Added to class
                    widget.cdance.cl.add(widget.name);
                    cnt--;
                    fl = true;
                  } else {
                    // Added to waiting list
                    widget.cdance.wait.add(widget.name);
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
    int n = widget.cdance.cl.length;
    for (int i = 0; i < n; i++) {
      log(widget.cdance.cl[i].toString());
    }
    log(n.toString());
    if (n >= 0 && n < 3) {
      return const Text("Added to the class");
    } else {
      return const Text("Added to waitng List");
    }
  }

  void removeName() {
    widget.cdance.cl.removeWhere((str) {
      return str == widget.name;
    });
    int n = widget.cdance.cl.length;
    if (n >= 3) {
      String temp = widget.cdance.wait[0];
      widget.cdance.cl.add(temp);
      widget.cdance.wait.removeWhere((str) {
        return str == temp;
      });
    }
  }
}
