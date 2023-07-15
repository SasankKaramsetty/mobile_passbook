import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'LoginScreen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 7500), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
          (Route<dynamic> route) => false);
    });

    return const Scaffold(
      backgroundColor: Color(0xff8E44AD),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 250),
            Text(
              'Mobile PassBook',
              style: TextStyle(
                fontSize: 35,
                color: Color(0xffF0F3F4),
              ),
            ),
            SizedBox(height: 50),
            Image(image: AssetImage("assets/pigggy.gif"),height: 250.0,  width: 250.0),
          ],
        ),
      ),
    );
  }
}
