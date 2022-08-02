import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kuddle_coding_test/pages/home_page.dart';
import 'package:kuddle_coding_test/pages/util.dart';

class YogaClass extends StatefulWidget {
  // const YogaClass({super.key});
  final String name;
  final Classes cyoga;
  @override
  YogaClass({
    required this.cyoga,
    required this.name,
    super.key,
  });
  State<YogaClass> createState() => _YogaClassState();
}

class _YogaClassState extends State<YogaClass> {
  // List<String> cl = [];
  // List<String> wait = [];

  int cnt = 3;
  bool fl = true;
  @override
  void init() {
    Classes cyoga;
    printcheck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Yoga Class")),
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
                    widget.cyoga.cl.add(widget.name);
                    cnt--;
                    fl = true;
                  } else {
                    // Added to waiting list
                    widget.cyoga.wait.add(widget.name);
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
    int n = widget.cyoga.cl.length;
    // Printing the names of the members of the class
    for (int i = 0; i < n; i++) {
      log(widget.cyoga.cl[i].toString());
    }
    log(n.toString());
    if (n >= 0 && n < 3) {
      return const Text("Added to the class");
    } else {
      return const Text("Added to waitng List");
    }
  }

  void removeName() {
    widget.cyoga.cl.removeWhere((str) {
      return str == widget.name;
    });
    int n = widget.cyoga.cl.length;
    if (n >= 3) {
      String temp = widget.cyoga.wait[0];
      widget.cyoga.cl.add(temp);
      widget.cyoga.wait.removeWhere((str) {
        return str == temp;
      });
    }
  }
}
