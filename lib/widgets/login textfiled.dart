import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFiledX extends StatelessWidget {
  const TextFiledX(
      {Key? key,
        required this.title,
        required this.hint,
        this.prefIcon,
        this.suffixIcon = null,
        required this.keyboardType,
        this.obscureText = false,
        required this.controll})
      : super(key: key);

  final String title;
  final String hint;
  final Icon? prefIcon;
  final TextInputType keyboardType;
  final bool? obscureText;
  final IconButton? suffixIcon;
  final TextEditingController controll;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.cairo(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 8.h,
        ),
        SizedBox(
          height: 48.h,
          child: TextField(
            style: TextStyle(fontSize: 12.sp),
            controller: controll,
            obscureText: obscureText!,
            keyboardType: keyboardType,
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              hintText: hint,
              hintStyle: GoogleFonts.cairo(fontSize: 14.sp, color: Colors.grey),
              prefixIcon: prefIcon,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  borderSide: BorderSide(width: .4.w, color: Colors.grey)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
            ),
          ),
        ),
      ],
    );
  }
}