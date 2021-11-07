
import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:cartswing/datasearch.dart';
import 'package:cartswing/model/categories.dart';
import 'package:cartswing/model/data.dart';
import 'package:cartswing/mybottombar.dart';
import 'package:cartswing/mydrawer.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'drawer_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key,required this.todo}) : super(key: key);
  final Data? todo;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List array = [];
  late WebViewController controller;
  List<DrawerData> list=[];
  bool isSearch=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // List<dynamic> dn_list=widget.todo!.categories!.cast<List<dynamic>>();
    // array.add(widget.todo[0]["links"]["home"]);
    // array.add(widget.todo[0]["links"]["search"]);
    // array.add(widget.todo[0]["links"]["cart"]);
    // array.add(widget.todo[0]["links"]["wallet"]);
    // array.add(widget.todo[0]["links"]["wishlist"]);
    // array.add(widget.todo[0]["links"]["myaccount"]);

    array.add(widget.todo!.links!.home);
    array.add(widget.todo!.links!.search);
    array.add(widget.todo!.links!.cart);
    array.add(widget.todo!.links!.wallet);
    array.add(widget.todo!.links!.wishlist);
    array.add(widget.todo!.links!.myaccount);
    /*for(int i=0;i<dn_list.length;i++) {
      list.add(DrawerData( dn_list[i]["name"],  dn_list[i]["url"],  int.parse(dn_list[i]["level"])));
      List<dynamic> children_data=dn_list[i]["children_data"];
      if(children_data.length>0){
        for(int j=0;j<children_data.length;j++){
          list.add(DrawerData(children_data[j]["name"], children_data[j]["url"], int.parse(children_data[j]["level"])));
          List<dynamic> children_data_second=dn_list[j]["children_data"];
          if(children_data_second.length>0){
            for(int k=0;k<children_data_second.length;k++){
              list.add(DrawerData(children_data_second[k]["name"], children_data_second[k]["url"], int.parse(children_data_second[k]["level"])));
            }
          }
        }
      }
    }*/
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
              title: Center(child: Image.asset('images/app_icon_transparent.png', fit: BoxFit.cover, height: 30,)),
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.black),
              actions: [
                IconButton(onPressed: () {
                  showSearch(context: context, delegate: DataSearch());
                }, icon: Icon(Icons.search))
              ]
          ),
          drawer:MyDrawer(list: widget.todo!.categories,
            onTap:  (context, url) {
              setState(() {
                Navigator.pop(context);
                controller.loadUrl(url!);
              });
            },
          ),
          body:
           WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: array.elementAt(_currentIndex),
              onWebViewCreated: (WebViewController webViewController) {
                controller = webViewController;
              },


            ),
          floatingActionButton:FloatingActionButton( //Floating action button on Scaffold
            backgroundColor: Colors.orange.shade700,
            onPressed: (){
              setState(() =>{});
              controller.loadUrl(widget.todo!.links?.cart??"",headers: {"MOBILEAPP":"1"});  //code to execute on button press
            },
            child: Icon(Icons.shopping_cart,color: Colors.white,), //icon inside button
          ),

          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: MyBottomBar(onPressed: (context, url) {
            setState(() =>{});
            controller.loadUrl(url!,headers: {"MOBILEAPP":"1"});
          }, links: widget.todo!.links,),
        ),
      );

  }

}
