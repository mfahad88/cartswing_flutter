
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
    return WillPopScope(
      onWillPop: () => _onBack(),
      child: StatefulBuilder(
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

      ),
    );
  }


  Future<bool> _onBack() async {
    bool goBack = false;
    var value = await controller.canGoBack(); // check webview can go back
    if (value) {
      controller.goBack(); // perform webview back operation
      return false;
    }else{
      return true;
    }
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
