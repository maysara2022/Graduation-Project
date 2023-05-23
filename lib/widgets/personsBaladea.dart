import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class persons extends StatelessWidget {
  const persons(
      {Key? key,
      required this.title,
      required this.suptilte,
      required this.ImageUrL})
      : super(key: key);

  final String title;
  final String suptilte;
  final String ImageUrL;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(ImageUrL),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Text(
                        overflow:TextOverflow.ellipsis,
                        title,
                        style: GoogleFonts.cairo(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),

                    ),
                    Text(
                      suptilte,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.cairo(color: Colors.black54),
                    ),
                  ],
                ),
              )
            ],
          ),
          Divider(
            indent: 10,
            endIndent: 10,
            thickness: 0.9,
          ),
        ],

    );
  }
}
