import 'package:flutter/material.dart';
import 'package:online_store/views/widgets/header_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

   @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget()
          ],
        ),
      ),
    );
  }
}