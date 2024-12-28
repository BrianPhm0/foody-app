import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foody/core/common/router.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      context.goNamed(AppRoute.bottomNav.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF003B73),
              Color(0xFF0074B7),
              Color(0xFF60A3D9),
            ],
          ),
        ),
        child: const Center(
            child: Text(
          'Dishcovery',
          style: TextStyle(
              fontSize: 50, color: Colors.white, fontFamily: 'LeckerliOne'),
        )),
      ),
    );
  }
}
