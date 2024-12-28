import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:foody/core/theme/app_color.dart';
import 'package:foody/features/presentation/pages/favorite/favorite_screen.dart';
import 'package:foody/features/presentation/pages/home/home_screen.dart';
import 'package:foody/features/presentation/pages/notify/notify_screen.dart';
import 'package:foody/features/presentation/pages/save/save_screen.dart';
import 'package:unicons/unicons.dart';

class BottomNav extends StatefulWidget {
  final int initialIndex;
  const BottomNav({super.key, this.initialIndex = 0});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  late int _bottomNavIndex;
  static List<IconData> iconList = [
    UniconsLine.home,
    UniconsLine.favorite,
    UniconsLine.bell,
    UniconsLine.save,
  ];

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    FavoriteScreen(),
    NotifyScreen(),
    SaveScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _bottomNavIndex = widget.initialIndex;
  }

  @override
  void didUpdateWidget(BottomNav oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialIndex != _bottomNavIndex) {
      setState(() {
        _bottomNavIndex = widget.initialIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_bottomNavIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Floating button action
        },
        shape: const CircleBorder(),
        backgroundColor:
            AppColor.secondery, // Màu nền cho nút// Hình tròn cho nút
        child: const Icon(
          UniconsLine.plus,
          color: AppColor.lightBackground,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive
              ? AppColor.secondery // Màu khi active
              : Colors.grey; // Màu khi không active
          return Icon(
            iconList[index],
            size: 30,
            color: color,
          );
        },
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
    );
  }
}
