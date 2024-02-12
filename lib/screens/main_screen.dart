import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:uts_menu_bar_salsacamelia/screens/comingsoon_screen.dart';
import 'package:uts_menu_bar_salsacamelia/screens/home_screen.dart';
import 'package:uts_menu_bar_salsacamelia/screens/genre_screen.dart';
import 'package:uts_menu_bar_salsacamelia/screens/profile_screen.dart';
import 'package:uts_menu_bar_salsacamelia/screens/tambah_film.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
int _index = 0;
  

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    
  bottomNavigationBar: CurvedNavigationBar(
    backgroundColor: Color.fromARGB(255, 250, 213, 235),
    items: [
      CurvedNavigationBarItem(
        child: Icon(Icons.home_outlined),
        label: 'Home',
      ),
      CurvedNavigationBarItem(
        child: Icon(Icons.add),
        label: 'Add Film',
      ),
      CurvedNavigationBarItem(
        child: Icon(Icons.chat_bubble_outline),
        label: 'ComingSoon',
      ),
      CurvedNavigationBarItem(
        child: Icon(Icons.newspaper),
        label: 'Genre',
      ),
      CurvedNavigationBarItem(
        child: Icon(Icons.perm_identity),
        label: 'Personal',
      ),
    ],
    onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    switch (_page) {
      case 0:
        return HomeScreen(); 
      case 1:
        return TambahFilm(); 
      case 2:
        return Comingsoon();
      case 3:
        return GenreScreen();
      case 4:
        return ProfileScreen(); 
      default:
        return Container(color: const Color.fromARGB(255, 68, 71, 255));
    }
  }
}