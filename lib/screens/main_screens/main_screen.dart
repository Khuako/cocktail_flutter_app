import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cocktail_project/constants/constant_colors.dart';
import 'package:cocktail_project/screens/main_screens/favorite_screen.dart';
import 'package:cocktail_project/screens/main_screens/home_screen.dart';
import 'package:cocktail_project/screens/main_screens/profile_screen.dart';
import 'package:cocktail_project/screens/main_screens/search_screen.dart';
import 'package:flutter/material.dart';

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
  List<Color> colors = const [
    ConstantColors.blueColor,
    Colors.yellow,
    Colors.red,
    Colors.white,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: _bottomNavIndex,
          children: pages,
        ),
        bottomNavigationBar: AnimatedBottomNavigationBar(
          gapLocation: GapLocation.none,
          backgroundColor: ConstantColors.lightBlack,
          activeColor: colors[_bottomNavIndex],
          inactiveColor: Colors.grey,
          icons: icons,
          splashColor: colors[_bottomNavIndex],
          activeIndex: _bottomNavIndex,
          onTap: (p0) {
            _bottomNavIndex = p0;
            setState(() {});
          },
        ));
  }
}
