import 'package:flutter/material.dart';
import 'package:online_store/views/widgets/header_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

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