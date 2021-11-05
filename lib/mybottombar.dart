import 'package:flutter/material.dart';
import 'drawer_data.dart';

class MyBottomBar extends StatelessWidget {
  const MyBottomBar({Key? key,required this.onTap}) : super(key: key);
  final void Function(BuildContext context,int index) onTap;
  @override
  Widget build(BuildContext context) {
    int _currentIndex=0;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      backgroundColor: colorScheme.surface,
      selectedItemColor: colorScheme.onSurface,
      unselectedItemColor: colorScheme.onSurface.withOpacity(.60),
      selectedLabelStyle: textTheme.caption,
      unselectedLabelStyle: textTheme.caption,
      onTap: (value) => this.onTap(context,value),
      items: [
        BottomNavigationBarItem(
          title: Text('Favorites'),
          icon: Icon(Icons.favorite),
        ),
        BottomNavigationBarItem(
          title: Text('Music'),
          icon: Icon(Icons.music_note),
        ),
        BottomNavigationBarItem(
          title: Text('Places'),
          icon: Icon(Icons.location_on),
        ),
        BottomNavigationBarItem(
          title: Text('News'),
          icon: Icon(Icons.library_books),
        ),
      ],
    );
  }
}
