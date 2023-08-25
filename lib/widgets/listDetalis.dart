import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ListDetails extends StatelessWidget{
  const ListDetails(
      {Key? key,
        required this.type,
        required this.fun,
      }): super(key: key);


  final String type;
  final VoidCallback fun;



  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(
          type,
          style: GoogleFonts.cairo(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        TextButton(
          onPressed: () {},
          child: TextButton(
              onPressed: fun,
              child: Text(
                'عرض الكل',
                style: GoogleFonts.cairo(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.w400),
              )),
        )
      ],
    );
  }
}