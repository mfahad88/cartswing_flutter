import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DataSearch extends SearchDelegate<String>{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: () {
      query="";
    }, icon: Icon(Icons.clear))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
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
   return WebView(
      javascriptMode: JavascriptMode.unrestricted,
      initialUrl: "https://csapi.piknpak.com.pk/catalogsearch/result/?q=${query}",

    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Text("");
  }
  
}