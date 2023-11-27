// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter6_sports_app/dependency_injection.dart';
import 'package:flutter6_sports_app/screens/pages/myHomePage.dart';
import 'package:flutter6_sports_app/state_management_or/preferences.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
  DependencyInjection.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Preferences(),
      child: Builder(
        builder: (context) {
          final preferences = Provider.of<Preferences>(context);
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Nova Sports',
            theme: ThemeData.light(
              //colorScheme: const ColorScheme.light(),
              useMaterial3: true,
            ),
            darkTheme: ThemeData.dark(
              // colorScheme: const ColorScheme.dark(),
              useMaterial3: true,
            ),
            themeMode: preferences.getThemeMode(),
            home: const MyHomePage(),
          );
        },
      ),
    );
  }
}



//     GetMaterialApp(
//       title: 'Nova Sports',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }
