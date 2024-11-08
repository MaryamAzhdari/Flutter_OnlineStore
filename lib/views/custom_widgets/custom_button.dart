import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Custom_Button extends StatelessWidget {
  final String title;
  final bool isLoading;

 const Custom_Button(
      {super.key,
      required this.title,
      required this.isLoading
      });
  
  
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 320,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: const LinearGradient(colors: [
            Color.fromARGB(255, 2, 48, 98),
            Color.fromARGB(255, 105, 116, 144),
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
        ),
        child: Stack(
          children: [
            Positioned(
                left: 280,
                top: 20,
                child: Opacity(
                  opacity: 0.5,
                  child: Container(
                    width: 60,
                    height: 60,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 12,
                            color: const Color.fromARGB(255, 49, 157, 220)),
                        borderRadius: BorderRadius.circular(30)),
                  ),
                )),
            Positioned(
                left: 250,
                top: 30,
                child: Opacity(
                  opacity: 0.5,
                  child: Container(
                    width: 10,
                    height: 10,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 3,
                            color: const Color.fromARGB(255, 49, 157, 220)),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                )),
            Positioned(
                left: 300,
                top: 25,
                child: Opacity(
                  opacity: 0.3,
                  child: Container(
                    width: 15,
                    height: 15,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                )),
            Positioned(
                left: 280,
                top: -7,
                child: Opacity(
                  opacity: 0.3,
                  child: Container(
                    width: 20,
                    height: 20,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                )),
            Center(
              child: isLoading ? const CircularProgressIndicator(color: Colors.white,): 
              Text(
                title,
                style: GoogleFonts.getFont(
                  'Nunito Sans',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.2,
                  fontSize: 20,
                ),
              ),
            )
          ],
        ));
  }
}
