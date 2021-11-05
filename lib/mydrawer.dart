
import 'package:cartswing/drawer_data.dart';
import 'package:cartswing/model/categories.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key,required this.list,required this.onTap}) : super(key: key);
  final List<DrawerData> list;
  final void Function(BuildContext,int index) onTap;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:
      ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(

            title: Text('${list[index].name}'),
            onTap:() => this.onTap(context,index),
          );
        },

      ),
    );
  }
}
