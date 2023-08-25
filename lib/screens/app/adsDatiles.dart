import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/firebase/fb_firstore_controller.dart';
import 'package:graduationproject/models/modelAds.dart';

class EditAdsPage extends StatelessWidget {

  final ModelAds ads;



  EditAdsPage({required this.ads}) {
    ads.title!;
    ads.content!;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16).w,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 16.h),
                Text(
                  ads.title!,
                  style: GoogleFonts.cairo(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  ads.content!,
                  style: GoogleFonts.cairo(
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}