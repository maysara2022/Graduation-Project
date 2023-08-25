import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EmergencyItems extends StatelessWidget {
  const EmergencyItems({Key? key, required this.title, required this.det}) : super(key: key);

  final String title;
  final String det;
  @override
  Widget build(BuildContext context) {


    return  Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: Row(
          children: [
            Text(
              title,
              style: GoogleFonts.cairo(
                  fontSize: 18.sp, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical:20),
            child: Text(
              det,
              style: GoogleFonts.cairo(fontSize: 14.sp),
            ),
          ),
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(width: 2.w, color: Colors.grey.shade300),
            borderRadius: BorderRadiusDirectional.circular(10.r),
          ),
        ),
      ),
    ],);
  }
}