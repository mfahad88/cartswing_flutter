// @dart=2.9
import 'package:cartswing/model/categories.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key,this.list,this.onTap}) : super(key: key);
  final List<Categories> list;
  final void Function(BuildContext context,String url) onTap;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Drawer(
        child:
        ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: list.length ,
          itemBuilder: (BuildContext context, int index) {
            return ExpansionTile(
              textColor: Color.fromRGBO(145, 199, 77, 1.00),
              iconColor: Color.fromRGBO(145, 199, 77, 1.00),
              title: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Text('${list[index].name}'),

                onTap: () => onTap(context,list[index].url),
              ),
              children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: list[index].childrenDataLevelOne.length??0,

                    itemBuilder: (context, i) {
                        return ExpansionTile(
                          textColor: Color.fromRGBO(145, 199, 77, 1.00),
                          iconColor: Color.fromRGBO(145, 199, 77, 1.00),
                            title: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: ListTile(
                                leading: Text('${list[index].childrenDataLevelOne[i].name}'),
                                onTap: () => onTap(context,list[index].childrenDataLevelOne[i].url),
                              ),
                            ),
                            children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                    physics: ClampingScrollPhysics(),
                                    itemCount: list[index].childrenDataLevelOne[i].childrenDataLevelTwo.length??0,
                                    itemBuilder: (context, j) {
                                        return Padding(
                                          padding: const EdgeInsets.only(left: 40.0),
                                          child: ListTile(

                                            leading: Text('${list[index].childrenDataLevelOne[i].childrenDataLevelTwo[j].name}'),
                                            onTap: () => onTap(context,list[index].childrenDataLevelOne[i].childrenDataLevelTwo[j].url),
                                          ),
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
      ),
    );
  }
}
