import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RecipeView extends StatefulWidget {

  final String postUrl;
  RecipeView({this.postUrl});

  @override
  _RecipeViewState createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {

  String finalUrl;
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  void initState() {
    // TODO: implement initState
    if(widget.postUrl.contains("http://")){
      finalUrl = widget.postUrl.replaceAll("http://", "https://");
    }else{
      finalUrl = widget.postUrl;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  const Color(0xffdfdfe5),
                  const Color(0xffffffff)
                ]
            )
        ),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: Platform.isIOS? 60: 40, right: 24, left: 24, bottom: 16),
              color: Colors.black54,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: kIsWeb ? MainAxisAlignment.start : MainAxisAlignment.center,
                children: <Widget>[
                  Text("JustCook", style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500
                  ),),
                  Text("Recipes", style: TextStyle(
                      color: Colors.red,
                      fontSize: 25,
                      fontWeight: FontWeight.w500
                  ),)
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 100,
              width: MediaQuery.of(context).size.width,
              child: WebView(
                initialUrl: finalUrl,
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController){
                  setState(() {
                    _controller.complete(webViewController);
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
