import "package:flutter/material.dart";
import "package:my_flutter_app/pages/home_page.dart";
import "package:my_flutter_app/pages/profile_page.dart";
import "package:my_flutter_app/pages/settings_page.dart";

class FirstPage extends StatefulWidget {
  FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _selectedIndex = 0;
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = [
    //homepage
    HomePage(),
    //profile page

    ProfilePage(),

    //settings page

    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Page"),
        backgroundColor: Colors.blue,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        items: [
          //home
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          //profile

          BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile"),

          //settings
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "settings")
        ],
      ),
    );
  }
}
