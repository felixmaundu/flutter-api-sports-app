// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter6_sports_app/screens/bottom_tabs/exploretab.dart';
import 'package:flutter6_sports_app/screens/bottom_tabs/extrasTab.dart';
import 'package:flutter6_sports_app/screens/bottom_tabs/favoritestab.dart';
import 'package:flutter6_sports_app/screens/bottom_tabs/hometabN.dart';
import 'package:flutter6_sports_app/screens/bottom_tabs/updatetab.dart';
import 'package:flutter6_sports_app/screens/drawer/settingpage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  // ignore: unused_field
  final int _exploreTabIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const HomeTabN(),
    // const HomeTab(),
    FavoritesTab(),
    UpdatesTab(),
    ExplorePage(),
    ExtrasTab()
    // const SettingPage()
    // const Text('Profile Page'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.browser_updated_sharp),
              label: 'updates',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.data_exploration_rounded),
              label: 'Extras',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed),
    );
  }
}
