import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cocktail_project/constants/constant_colors.dart';
import 'package:cocktail_project/screens/favorite_screen.dart';
import 'package:cocktail_project/screens/home_screen.dart';
import 'package:cocktail_project/screens/profile_screen.dart';
import 'package:cocktail_project/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _bottomNavIndex = 0;
  List<Widget> pages = const [
    HomeScreen(),
    SearchScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];
  List<IconData> icons = const [
    Icons.home_sharp,
    Icons.search,
    Icons.favorite,
    Icons.person,
  ];
  List<String> names = const [
    'Home',
    'Search',
    'Favorites',
    'Profile',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            names[_bottomNavIndex],
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          backgroundColor: ConstantColors.lightBlack,
          elevation: 0,
          centerTitle: true,
        ),
        body: IndexedStack(
          index: _bottomNavIndex,
          children: pages,
        ),
        bottomNavigationBar: AnimatedBottomNavigationBar(
          gapLocation: GapLocation.center,
          backgroundColor: ConstantColors.lightBlack,
          activeColor: ConstantColors.blueColor,
          inactiveColor: Colors.grey,
          icons: icons,
          splashColor: ConstantColors.blueColor,
          activeIndex: _bottomNavIndex,
          onTap: (p0) {
            _bottomNavIndex = p0;
            setState(() {});
          },
        ));
  }
}
