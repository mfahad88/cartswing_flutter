// @dart=2.9
import 'package:cartswing/mywebview.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DataSearch extends SearchDelegate<String>{
  DataSearch(this.url);
  final String url;
   WebViewController controller;
  bool inAsyncCall = false;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(onPressed: () {
      query="";
    }, icon: Icon(Icons.clear))];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow,progress: transitionAnimation,),
      onPressed: () {
      close(context, "");
      },
      
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
   return StatefulBuilder(
     builder: (context, setState) => Scaffold(
       backgroundColor: Colors.transparent,
       body: MyWebView("${url}${query}"),
     ),
   );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Text("");
  }


}