import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/core/utils/text_custom.dart';
import 'package:foody/core/utils/toggle_button.dart';
import 'package:foody/features/presentation/blocs/cubit/theme_cubit.dart';
import 'package:foody/features/presentation/components/home/settings_item.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const TextCustom(
          text: 'Notifycations and Settings',
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextCustom(
                  text: 'My notifications',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.grey,
                  height: 1,
                  width: double.infinity,
                ),
                const SettingsItem(
                  title: "Mobile push notifications",
                  subtitle: 'Receive push notifications',
                  isToggle: true,
                ),
                const SettingsItem(
                  title: "Always send email notifications",
                  subtitle:
                      'Receive emails about activity in your workspace, etc',
                  isToggle: true,
                ),
                const SizedBox(height: 30),
                const TextCustom(
                  text: 'My settings',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.grey,
                  height: 1,
                  width: double.infinity,
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    print('Settings');
                  },
                  child: const SettingsItem(
                      title: "Information and contact",
                      subtitle: 'Name, email, and phone number',
                      isToggle: false),
                ),
                GestureDetector(
                  onTap: () {
                    print('Settings');
                  },
                  child: const SettingsItem(
                      title: "Password",
                      subtitle: 'Change password',
                      isToggle: false),
                ),
                GestureDetector(
                  onTap: () {
                    print('');
                  },
                  child: const SettingsItem(
                      title: "Language", subtitle: 'English', isToggle: false),
                ),
                InkWell(
                  onTap: () => context.read<ThemeCubit>().toggleTheme(),
                  child: const SettingsItem(
                    title: "Appearance",
                    subtitle: 'Dark mode',
                    isToggle: true,
                  ),
                ),
                const SizedBox(height: 30),
                const TextCustom(
                  text: 'Support',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                GestureDetector(
                  onTap: () {
                    print('Settings');
                  },
                  child: const SettingsItem(
                      title: "Request account deletion",
                      subtitle: 'Delete your account',
                      isToggle: false),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
