import 'package:flutter/material.dart';
import 'package:kuddle_coding_test/pages/home_page.dart';
import 'package:kuddle_coding_test/pages/util.dart';

class LoginIn extends StatefulWidget {
  final Classes cgym;
  final Classes cdance;
  final Classes cyoga;
  LoginIn({
    required this.cdance,
    required this.cgym,
    required this.cyoga,
    super.key,
  });
  @override
  State<LoginIn> createState() => _LoginInState();
}

class _LoginInState extends State<LoginIn> {
  TextEditingController uname = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Kuddle App",
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: uname,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Enter Name',
                  hintText: 'Enter Your Name'),
            ),
            MaterialButton(
              elevation: 0,
              height: 50,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => HomePage(
                              name: uname.toString(),
                              cdance: widget.cdance,
                              cgym: widget.cgym,
                              cyoga: widget.cyoga,
                            )));
              },
              color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Get Started',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
              textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
