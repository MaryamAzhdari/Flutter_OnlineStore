import 'package:flutter/material.dart';
import 'package:online_store/theme.dart';
import 'package:online_store/views/screens/root_bottum_navigation.dart';
import 'package:provider/provider.dart';
import 'services/theme_service.dart';


void main() {
  //runApp(const MyApp());
  //Use Provider(ThemeService Class)
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeService(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key});
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //return const DefultCode();
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return MaterialApp(
        themeMode:
            themeService.isLightModeOn ? ThemeMode.light : ThemeMode.dark,
      theme: AppTheme.lightTheme,
      //theme: appTheme,
      darkTheme: AppTheme.darkTheme,
        home: RootNottumNavigationScreen(),
        
        // routes: <String, WidgetBuilder>{
        //   '/root': (BuildContext context) =>
        //       const RootBottomNavigationExample(),
        //   '/screenOne': (BuildContext context) => const ScreenOne(),
        //   '/screenTwo': (BuildContext context) => const ScreenTwo(),
        // },
      );
    });
  }



// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     ThemeService themeService = ThemeService();
//     //return Consumer<ThemeService>(builder: (context, themeService, child) {
//     return MaterialApp(
//       themeMode: themeService.isLightModeOn ? ThemeMode.light : ThemeMode.dark,
//       theme: AppTheme.lightTheme,
//       //theme: appTheme,
//       darkTheme: AppTheme.darkTheme,
//       //home: const SignupScreen(),
//       home: MainScreen(),
//     );
//     //});
//   }
}
