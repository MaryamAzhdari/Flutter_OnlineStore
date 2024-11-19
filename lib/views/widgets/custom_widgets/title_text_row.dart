import 'package:flutter/material.dart';

class TitleTextRow extends StatelessWidget {
  final String title;
  final Function() onTap;
  
  const TitleTextRow({required this.title, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            'View All',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        )
      ],
    );
  }
}
