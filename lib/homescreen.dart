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
import 'package:modal_progress_hud/modal_progress_hud.dart';
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
  bool isSearch = true;
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
              )),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: DataSearch(widget.todo.links.search));
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
      body:   MyWebView(url,
      onWebViewCreated:(context, webViewController) {
        this.webViewController=webViewController;
      } ,
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




}
