import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IconColumn extends StatelessWidget{
  IconColumn(
      {Key? key,
        required this.icon3,
        required this.texticon,
        required this.fun,
      }): super(key: key);


  final String icon3;
  final String texticon;
  final VoidCallback fun;



  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            border: Border.all(width: .2, color: Colors.black45),
            borderRadius: BorderRadiusDirectional.circular(20),
          ),
          child: Center(
            child: GestureDetector(
              onTap:fun,

              child: Image.asset(
                icon3,
                width: 50,
                height: 50,
              ),
            ),
          ),
        ),
        Text(
          texticon,
          style: GoogleFonts.cairo(fontSize: 12),
        ),
      ],
    );
  }
}
