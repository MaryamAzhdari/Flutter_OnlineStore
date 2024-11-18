import 'package:flutter/material.dart';
import 'package:online_store/services/theme_service.dart';
import 'package:online_store/views/widgets/header_widget.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //ThemeService themeService = ThemeService();
    return Scaffold(
        body: Consumer<ThemeService>(builder: (context, themeService, child) {
      return SingleChildScrollView(
        child: Column(
          children: [
            const HeaderWidget(),
            const SizedBox(height: 20,),
            Container(
              width: 80,
              height: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Switch(
                  
                  value: themeService.isLightModeOn,
                  onChanged: (_) {
                    themeService.toggleTheme();
                  }),
            ),
          ],
        ),
      );
    }));
  }
}
