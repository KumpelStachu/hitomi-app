import 'package:flutter/material.dart';
import 'package:hitomi/routes/home_downloads.dart';
import 'package:hitomi/routes/home_favourites.dart';
import 'package:hitomi/routes/home_latest.dart';
import 'package:hitomi/routes/home_settings.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _pageController = PageController();
  var _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: (page) => _pageController.animateToPage(page,
            duration: const Duration(seconds: 1),
            curve: Curves.fastLinearToSlowEaseIn),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.today_outlined),
            activeIcon: Icon(Icons.today),
            label: 'Latest',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            activeIcon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download_outlined),
            activeIcon: Icon(Icons.download),
            label: 'Downloads',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        useLegacyColorScheme: false,
        type: BottomNavigationBarType.fixed,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (page) => setState(() {
          _selectedPage = page;
        }),
        children: const [
          HomeLatest(),
          HomeFavourites(),
          HomeDownloads(),
          HomeSettings(),
        ],
      ),
    );
  }
}
