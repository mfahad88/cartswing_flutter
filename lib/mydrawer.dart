
import 'package:cartswing/drawer_data.dart';
import 'package:cartswing/model/categories.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key,required this.list,required this.onTap}) : super(key: key);
  final List<Categories>? list;
  final void Function(BuildContext context,String? url) onTap;



  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:

      ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: list!.length ,
        itemBuilder: (BuildContext context, int index) {
          return ExpansionTile(

            title: ListTile(
              leading: Text('${list![index].name}'),

              onTap: () => onTap(context,list![index].url),
            ),
            children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: list![index].childrenDataLevelOne?.length??0,
                  itemBuilder: (context, i) {
                      return ExpansionTile(
                          title: ListTile(
                            leading: Text('${list![index].childrenDataLevelOne![i].name}'),
                            onTap: () => onTap(context,list![index].childrenDataLevelOne![i].url),
                          ),
                          children: [
                              ListView.builder(
                                shrinkWrap: true,
                                  physics: ClampingScrollPhysics(),
                                  itemCount: list![index].childrenDataLevelOne![i].childrenDataLevelTwo?.length??0,
                                  itemBuilder: (context, j) {
                                      return ListTile(

                                        leading: Text('${list![index].childrenDataLevelOne![i].childrenDataLevelTwo![j].name}'),
                                        onTap: () => onTap(context,list![index].childrenDataLevelOne![i].childrenDataLevelTwo![j].url),
                                      );
                                  },
                              )
                        ],
                      );
                  },
                )
            ],
            // onTap:() => this.onTap(context,index),
          );
        },

      ),
    );
  }
}
