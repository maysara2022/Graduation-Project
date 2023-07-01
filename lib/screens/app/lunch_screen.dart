import 'package:flutter/material.dart';
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
              const SizedBox(
                width: 200,
                height: 200,
                child: CircleAvatar(
                  backgroundImage: AssetImage(

                    "images/logop.jpg",
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text("بـــلـدي - بلدية المغازي",
                  style: GoogleFonts.cairo(color: Colors.white, fontSize: 25)),
              Text(
                "2023 - 2024",
                style: GoogleFonts.cairo(color: Colors.grey, fontSize: 20),
              )
            ],
          ),
        )));
  }
}
