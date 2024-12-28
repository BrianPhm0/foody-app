import 'package:flutter/material.dart';
import 'package:foody/core/common/router.dart';
import 'package:foody/core/theme/app_color.dart';
import 'package:foody/core/utils/button_custom.dart';
import 'package:foody/core/utils/text_custom.dart';
import 'package:foody/features/presentation/components/home/info_title.dart';
import 'package:foody/features/presentation/components/home/user_info.dart';
import 'package:go_router/go_router.dart';

class UserSetting extends StatefulWidget {
  const UserSetting({super.key});

  @override
  State<UserSetting> createState() => _UserSettingState();
}

class _UserSettingState extends State<UserSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const TextCustom(
          text: 'Account',
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                UserInfo(
                    context: context, title: 'User', value: 'duc@gmail.com'),
                const SizedBox(height: 30),
                InfoTitle(
                    context: context,
                    title: 'Address',
                    icon: Icons.location_on),
                const SizedBox(
                  height: 18,
                ),
                InfoTitle(
                    context: context, title: 'Help Centre', icon: Icons.help),
                const SizedBox(
                  height: 18,
                ),
                InkWell(
                  onTap: () {
                    context.pushNamed(AppRoute.settings.name);
                  },
                  child: InfoTitle(
                      context: context,
                      title: 'User Policy',
                      icon: Icons.policy),
                ),
                const SizedBox(
                  height: 18,
                ),
                InkWell(
                  onTap: () {
                    context.pushNamed(AppRoute.settings.name);
                  },
                  child: InfoTitle(
                      context: context,
                      title: 'Settings',
                      icon: Icons.settings),
                ),
                const SizedBox(
                  height: 18,
                ),
                InfoTitle(
                    context: context,
                    title: 'About Dishcovery',
                    icon: Icons.info),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 50,
                  child: CustomButton(
                    name: 'Sign out',
                    fontWeight: FontWeight.bold,
                    onPressed: () {},
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
