// @dart=2.9

import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:cartswing/datasearch.dart';
import 'package:cartswing/model/categories.dart';
import 'package:cartswing/model/data.dart';
import 'package:cartswing/mybottombar.dart';
import 'package:cartswing/mydrawer.dart';
import 'package:cartswing/mywebview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key, this.todo}) : super(key: key);
  final Data todo;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String url;
  final int _currentIndex = 0;
  List array = [];
  bool isSearch = false;
  WebViewController webViewController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    if (Platform.isIOS) WebView.platform = CupertinoWebView();

    url=widget.todo.links.home;
    array.add(widget.todo.links.home);
    array.add(widget.todo.links.search);
    array.add(widget.todo.links.cart);
    array.add(widget.todo.links.wallet);
    array.add(widget.todo.links.wishlist);
    array.add(widget.todo.links.myaccount);

  }



  @override
  Widget build(BuildContext context) {

    final bool showFab = MediaQuery.of(context).viewInsets.bottom==0.0;
    return Scaffold(
      resizeToAvoidBottomInset:true,
      appBar: AppBar(
          title: Center(
              child: Image.asset(
                'images/app_icon_transparent.png',
                fit: BoxFit.cover,
                height: 30,
              ),
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    isSearch=isSearch==true?false:true;
                  });
                  // showSearch(context: context, delegate: DataSearch(widget.todo.links.search));
                },
                icon: Icon(Icons.search))
          ]),
      drawer: MyDrawer(
        list: widget.todo.categories,

        onTap: (context, url) {
          setState(() {
            webViewController.loadUrl(url);
          });
        },
      ),
      body:   Column(
        children: [
      Visibility(
        visible: isSearch,
        child: TextField(
        decoration: const InputDecoration(
        border: OutlineInputBorder(),
          hintText: 'Search here'
          ),
          onSubmitted: (value) {
            setState(() {
              this.webViewController.loadUrl("${widget.todo.links.search}${value}");
              isSearch=false;
            });
          },
        ),
      ),
          Expanded(
            child: WillPopScope(
              onWillPop: () => _onBack(),
              child: MyWebView(url,
              onWebViewCreated:(context, webViewController) {
                this.webViewController=webViewController;
              } ,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: showFab?FloatingActionButton(

        //Floating action button on Scaffold
        backgroundColor: Colors.orange.shade700,
        onPressed: () {
          setState(() {
            webViewController.loadUrl(widget.todo.links.cart);

          });
        },
        child: Icon(
          Icons.shopping_cart,
          color: Colors.white,
        ), //icon inside button
      ):null,
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: MyBottomBar(
        onPressed: (context, url) {
          setState(() => webViewController.loadUrl(url));

        },
        links: widget.todo.links,
      ),
    );
  }

  Future<bool> _onBack() async {

    bool goBack = false;
    var value = await webViewController.canGoBack(); // check webview can go back
    if (value) {
      webViewController.goBack(); // perform webview back operation
      goBack= false;
    }else{
      goBack=true;
    }
    print("Backpresssed---->${goBack}");
    return goBack;
    /*else {
      await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => new AlertDialog(
          title:
              new Text('Confirmation ', style: TextStyle(color: Colors.purple)),

          // Are you sure?

          content: new Text('Do you want exit app ? '),

          // Do you want to go back?

          actions: <Widget>[
            new FlatButton(
              onPressed: () {
                // Navigator.of(context).pop(false);
                Platform.isIOS
                    ? exit(0)
                    : SystemChannels.platform.invokeMethod('SystemNavigator.pop');

                setState(() {
                  goBack = false;
                });
              },

              child: new Text('Yes'), // No
            ),
            new FlatButton(
              onPressed: () {

                Navigator.pop(context,false);
                // Navigator.of(context).pop(true);

                setState(() {
                  goBack = true;
                });
              },

              child: new Text('No'), // Yes

            ),
          ],
        ),
      );

      if (goBack) Navigator.pop(context); // If user press Yes pop the page

      return goBack;
    }*/
  }


}
