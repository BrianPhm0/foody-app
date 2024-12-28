import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foody/features/presentation/components/home/search_screen.dart';
import 'package:foody/features/presentation/pages/home/bottom_nav.dart';
import 'package:foody/features/presentation/pages/home/find_city.dart';
import 'package:foody/features/presentation/pages/home/settings.dart';
import 'package:foody/features/presentation/pages/home/user_setting.dart';
import 'package:foody/features/presentation/pages/splash_screen.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  splash,
  bottomNav,
  home,
  userSetting,
  settings,
  findCity,
  search,
  login,
  register,
  profile,

  about,
  notFound,
}

class AppRouter {
  static final GoRouter router =
      GoRouter(initialLocation: '/splash', routes: <RouteBase>[
    GoRoute(
      path: '/splash',
      name: AppRoute.splash.name,
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      name: AppRoute.bottomNav.name,
      path: '/bottomNav',
      builder: (context, state) => const BottomNav(),
    ),
    GoRoute(
      name: AppRoute.userSetting.name,
      path: '/userSetting',
      builder: (context, state) => const UserSetting(),
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const UserSetting(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0); // Bắt đầu từ phải
          const end = Offset.zero; // Dừng ở giữa
          const curve = Curves.easeInOut;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      name: AppRoute.settings.name,
      path: '/settings',
      builder: (context, state) => const Settings(),
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const Settings(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0); // Bắt đầu từ phải
          const end = Offset.zero; // Dừng ở giữa
          const curve = Curves.easeInOut;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      name: AppRoute.findCity.name,
      path: '/findCity',
      builder: (context, state) => const FindCity(),
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const FindCity(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0); // Bắt đầu từ phải
          const end = Offset.zero; // Dừng ở giữa
          const curve = Curves.easeInOut;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      name: AppRoute.search.name,
      path: '/search',
      builder: (context, state) => const SearchScreen(),
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const SearchScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0); // Bắt đầu từ phải
          const end = Offset.zero; // Dừng ở giữa
          const curve = Curves.easeInOut;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    ),
  ]);

  static void goTo(String path) {
    router.go(path);
  }
}
