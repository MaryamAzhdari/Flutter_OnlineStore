import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewWidget extends StatelessWidget {
  final Function(String value) onChanged;
  const NewWidget({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        () => onChanged(value);
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'enter your full name';
        } else {
          return null;
        }
      },
      initialValue: 'test',
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          labelText: 'Enter your FullName',
          labelStyle: GoogleFonts.getFont('Nunito Sans',
              fontSize: 14, letterSpacing: 0.1),
          prefixIcon: const Icon(
            Icons.email_rounded,
            size: 20,
          )),
    );
  }
}
