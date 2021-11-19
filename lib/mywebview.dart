
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebView extends StatelessWidget {
  MyWebView(this.url,{required Key key,required this.onWebViewCreated});
  double progress=0;
  late WebViewController controller;
  String url;
  Function (BuildContext context,WebViewController webViewController) onWebViewCreated;
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Column(
          children: [
            LinearProgressIndicator(
              backgroundColor: Colors.black12,
              color: progress==1.0?Colors.transparent:Color.fromRGBO(145, 199, 77, 1.00),
              value: progress,

            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: WebView(
                  userAgent: "MOBILEAPP",
                  javascriptMode: JavascriptMode.unrestricted,
                  initialUrl: url,
                  onWebViewCreated: (WebViewController webViewController){
                    this.onWebViewCreated(context,webViewController);
                  },
                  /*onWebViewCreated: (WebViewController webViewController) {

                    controller = webViewController;
                  },*/

                  onProgress: (progress) {
                    setState(() {
                      this.progress=progress/100;
                      print("Progress----> ${this.progress}");


                    });
                  },
                ),
              ),
            ),
          ],
        );
      },

    );
  }



}
