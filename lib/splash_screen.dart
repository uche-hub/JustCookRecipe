import 'dart:async';

import 'package:flutter/material.dart';
import 'package:justcook/views/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  startTimer() async{
    var duration = Duration(seconds: 4);
    return Timer(duration, route);
  }

  route(){
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => Home()
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset("images/justcook.jpg"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            Text(
              "JUST COOK",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
            ),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
            )
          ],
        ),
      ),
    );
  }
}
