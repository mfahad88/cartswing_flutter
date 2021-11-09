// @dart=2.9

import 'package:cartswing/model/links.dart';
import 'package:flutter/material.dart';

class MyBottomBar extends StatelessWidget {
  const MyBottomBar({Key key,this.links,this.onPressed}) : super(key: key);
  final void Function(BuildContext context,String url) onPressed;
  final Links links;
  @override
  Widget build(BuildContext context) {
    int _currentIndex=0;


    return  BottomAppBar( //bottom navigation bar on scaffold
      color:Color.fromRGBO(145, 199, 77, 1.00),
      shape: CircularNotchedRectangle(), //shape of notch
      notchMargin: 10, //notche margin between floating button and bottom appbar
      child: Row( //children inside bottom appbar
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(icon: Icon(Icons.home, color: Colors.white,), onPressed: () => onPressed(context,links.home),),
          Container(margin: EdgeInsets.only(right: 100),child: IconButton(icon: Icon(Icons.account_balance_wallet, color: Colors.white,), onPressed: () => onPressed(context,links.wallet),)),
          IconButton(icon: Icon(Icons.favorite, color: Colors.white,), onPressed: () => onPressed(context,links.wishlist),),
          IconButton(icon: Icon(Icons.account_circle, color: Colors.white,), onPressed: () => onPressed(context,links.myaccount),),
        ],
      ),
    );
    /*BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      backgroundColor: Color.fromRGBO(145, 199, 77, 1.00),
      selectedItemColor: colorScheme.onSurface,
      unselectedItemColor: colorScheme.onSurface.withOpacity(.60),
      selectedLabelStyle: textTheme.caption,
      unselectedLabelStyle: textTheme.caption,
      onTap: (value) => this.onTap(context,value),
      items: [

        BottomNavigationBarItem(


          icon: Icon(Icons.favorite),
        ),
        BottomNavigationBarItem(

          icon: Icon(Icons.music_note),
        ),
        BottomNavigationBarItem(

          icon: Container(
            padding: EdgeInsets.fromLTRB(4,8,8,8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orange,
            ),
            child: FlutterLogo(
              size: 38.0,
            ),
          ),
        ),
        BottomNavigationBarItem(

          icon: Icon(Icons.location_on),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_books),
        ),
      ],
    );*/
  }
}
