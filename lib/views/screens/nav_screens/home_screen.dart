import 'package:flutter/material.dart';
import 'package:online_store/views/widgets/banner_widget.dart';
import 'package:online_store/views/widgets/category_item_widget.dart';
import 'package:online_store/views/widgets/custom_widgets/title_text_row.dart';
import 'package:online_store/views/widgets/header_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderWidget(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const BannerWidget(),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TitleTextRow(title: 'Category', onTap: () {}),
                  ),
                  const CategoryItemWidget()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
