import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class Unavilable extends StatelessWidget {
  const Unavilable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 200.h,
                width: 200.w,
                child: Image.asset('images/happy-cat-26.gif')),
            SizedBox(height: 100,),
            Text('عُذراً ,  قم بتسجيل الدخول أولاً',style: GoogleFonts.cairo(fontSize: 22.sp,fontWeight: FontWeight.bold),),
            SizedBox(
              height: 50.h,
            ),
            Align
              (
              alignment: AlignmentDirectional.bottomCenter,
              child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/sign_in');
                  },
                  child: Text(
                    "تسجيل الدخول",
                    style:
                    GoogleFonts.cairo(color: Color(0xFFb70e0e)),
                  )),
            ),



          ],
        ),
      ),
    );

  }
}