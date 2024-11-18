import 'package:flutter/material.dart';
import 'package:online_store/views/widgets/banner_widget.dart';
import 'package:online_store/views/widgets/category_item_widget.dart';
import 'package:online_store/views/widgets/header_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(),
            BannerWidget(),
            CategoryItemWidget()
          ],
        ),
      ),
    );
  }
}