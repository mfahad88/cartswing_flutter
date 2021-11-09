// @dart=2.9
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
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
     builder: (context, setState) => ModalProgressHUD(
       inAsyncCall: inAsyncCall,
       child: Scaffold(
         backgroundColor: Colors.transparent,
         body: WebView(
           javascriptMode: JavascriptMode.unrestricted,
           userAgent: "MOBILEAPP",
           initialUrl: "${url}${query}",
           onWebViewCreated: (WebViewController webViewController) {
             controller = webViewController;
           },

           onProgress: (progress) {
             print("Finished----> ${progress}");
             if(progress>0 && progress<90){
               setState(() {
                 inAsyncCall = true;
               });
             }
             else if (progress > 90) {
               setState(() {
                 inAsyncCall = false;
               });
             }
           },
           onPageStarted: (url) {
           },
           onPageFinished: (url) {
             setState(()=> inAsyncCall=false);
           },
         ),
       ),
     ),
   );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Text("");
  }


}