import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final String? labelText;

  final bool? obscureText;
  final TextEditingController controller;
  final OutlineInputBorder? enabledBorder;
  final OutlineInputBorder? focusedBorder;
  final OutlineInputBorder? focusErrorBorder;
  final Widget? suffixIcon;
  final String? hintText;
  final String? validateMsg;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.hintText,
    this.onChanged,
    this.obscureText,
    this.enabledBorder,
    this.focusedBorder,
    this.focusErrorBorder,
    this.suffixIcon,
    this.validateMsg,
    this.keyboardType,
    this.inputFormatters,
    required Icon prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validateMsg ?? 'value is empty';
        } else {
          return null;
        }
      },
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      controller: controller,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.grey),
          fillColor: Colors.grey[200],
          filled: true,
          border: InputBorder.none,
          enabledBorder: enabledBorder,
          focusedBorder: focusedBorder,
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: focusErrorBorder),
    );
  }
}

poppinsText({text, color, fontWeight, double? fontSize, textAlign, overflow}) {
  return Text(text,
      overflow: overflow,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
          color: color, fontWeight: fontWeight, fontSize: fontSize));
}

poppinsHeadText({text, textAlign, double? fontSize, color}) {
  return Text(text,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
          color: color ?? const Color(0xFF101828),
          fontWeight: FontWeight.w600,
          fontSize: fontSize ?? 16));
}

poppinsSmallText({text, color, fontWeight, textAlign}) {
  return Text(text,
      // overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
          color: color ?? Color.fromARGB(255, 11, 11, 11), fontSize: 12));
}

Widget travelDetailsText({String? value, double? fontsize, fontWeight, color}) {
  return Row(
    children: [
      Text(
        value!,
        style: GoogleFonts.poppins(
            fontSize: fontsize,
            fontWeight: fontWeight,
            color: color ?? Colors.black,
            letterSpacing: 1),
      ),
    ],
  );
}


// interHeadText({text}) {
//   return Text(text,
//       style: GoogleFonts.inter(
//           color: const Color(0xFF1A1A1A),
//           fontWeight: FontWeight.bold,
//           fontSize: 20));
// }

// interSubText({text, color, fontWeight}) {
//   return Text(text,
//       style: GoogleFonts.inter(
//           color: color ?? const Color(0xFF1A1A1A),
//           fontWeight: fontWeight ?? FontWeight.w400,
//           fontSize: 14));
// }