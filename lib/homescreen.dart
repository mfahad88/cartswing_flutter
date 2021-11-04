import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'drawer_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key,required this.todo}) : super(key: key);
  final dynamic todo;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List array = [];
  List drawerList=[];
  late WebViewController controller;
  List<DrawerData> list=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    array.add(widget.todo[0]["links"]["home"]);
    array.add(widget.todo[0]["links"]["search"]);
    array.add(widget.todo[0]["links"]["cart"]);
    array.add(widget.todo[0]["links"]["wallet"]);
    array.add(widget.todo[0]["links"]["wishlist"]);
    array.add(widget.todo[0]["links"]["myaccount"]);
  }
  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        drawer: Drawer(

        ),
        body:Text('${widget.todo[0]["categories"]}')/*WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: array.elementAt(_currentIndex),
          onWebViewCreated: (WebViewController webViewController) {
            controller = webViewController;
          },
        )*/,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          backgroundColor: colorScheme.surface,
          selectedItemColor: colorScheme.onSurface,
          unselectedItemColor: colorScheme.onSurface.withOpacity(.60),
          selectedLabelStyle: textTheme.caption,
          unselectedLabelStyle: textTheme.caption,
          onTap: (value) {
            // Respond to item press.
            setState(() => _currentIndex = value);
            controller.loadUrl(array.elementAt(_currentIndex));

          },
          items: [
            BottomNavigationBarItem(
              title: Text('Favorites'),
              icon: Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              title: Text('Music'),
              icon: Icon(Icons.music_note),
            ),
            BottomNavigationBarItem(
              title: Text('Places'),
              icon: Icon(Icons.location_on),
            ),
            BottomNavigationBarItem(
              title: Text('News'),
              icon: Icon(Icons.library_books),
            ),
          ],
        ),
      ),
    );
  }
}
