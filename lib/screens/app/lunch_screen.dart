import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/prefs/shared_pref_controller.dart';

class lunch_screen extends StatefulWidget {
  const lunch_screen({Key? key}) : super(key: key);

  @override
  State<lunch_screen> createState() => _lunch_screenState();
}

// ignore: camel_case_types
class _lunch_screenState extends State<lunch_screen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds:3), () {

      bool loggedIn = SharedPrefController().getValue<bool>(key: PrefKeys.loggedIn.name)?? false;
      String rout = loggedIn ? '/bottom_screen' :'/log_up';
      Navigator.pushReplacementNamed(context, rout);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(1.0), Colors.red.shade300],
                    end: AlignmentDirectional.topStart,
                    begin: AlignmentDirectional.bottomEnd,
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200.w,
                    height: 200.h,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(

                        "images/logop.jpg",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text("بـــلـدي - بلدية المغازي",
                      style: GoogleFonts.cairo(color: Colors.white, fontSize: 25.sp)),
                  Text(
                    "2023 - 2024",
                    style: GoogleFonts.cairo(color: Colors.grey, fontSize: 20.sp),
                  )
                ],
              ),
            )));
  }
}