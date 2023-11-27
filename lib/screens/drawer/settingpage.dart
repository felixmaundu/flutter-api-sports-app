// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter6_sports_app/state_management_or/preferences.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final preferences = Provider.of<Preferences>(context);
    final currentThemeMode = preferences.getThemeMode();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Choose Theme Mode:'),
            buildListTile(
              'Light',
              ThemeMode.light,
              currentThemeMode,
              () {
                preferences.themeMode = ThemeModeOption.light;
              },
            ),
            buildListTile(
              'Dark',
              ThemeMode.dark,
              currentThemeMode,
              () {
                preferences.themeMode = ThemeModeOption.dark;
              },
            ),
            buildListTile(
              'System Default',
              ThemeMode.system,
              currentThemeMode,
              () {
                preferences.themeMode = ThemeModeOption.system;
              },
            ),
          ],
        ),
      ),
    );
  }

  ListTile buildListTile(
    String title,
    ThemeMode option,
    ThemeMode currentThemeMode,
    VoidCallback onTap,
  ) {
    final isSelected = option == currentThemeMode;

    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: onTap,
    );
  }
}
