import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthTopPart extends StatelessWidget {
  final String title;
  final String sunTitle;
  final String imgPath;
  const AuthTopPart({super.key, required this.title, required this.sunTitle, required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
       Text(title,
          style: GoogleFonts.getFont('Lato',
              color: Colors.black,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.2,
              fontSize: 23)),
       Text(sunTitle,
          style: GoogleFonts.getFont('Lato',
              color: Colors.black,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.2,
              fontSize: 14)),
      Image.asset(
        imgPath,
        width: 300,
        height: 300,
      ),
    ]);
  }
}
