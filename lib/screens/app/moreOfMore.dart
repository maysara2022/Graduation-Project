import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/prefs/shared_pref_controller.dart';

class MoreOFMore extends StatelessWidget {
  const MoreOFMore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(

          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'رؤية البلدية',
            style: GoogleFonts.cairo(color: Colors.black),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed:Navigator.of(context).pop,
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
          children: [
            Divider(
              indent: 20,
              endIndent: 20,
              thickness: 0.5,
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/possMassage');
              },
              title: Text('كلمة رئيس البلدية',
                  style: GoogleFonts.cairo(
                      fontWeight: FontWeight.bold, fontSize: 13)),
              trailing: Icon(
                Icons.keyboard_arrow_left,
                color: Colors.black38,
              ),
              leading: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10),
                  color: Colors.grey.shade200,
                ),
                height: 30,
                width: 30,
                child: Icon(Icons.message_outlined, color: Colors.black),
              ),
            ),
            Divider(
              indent: 20,
              endIndent: 20,
              thickness: 0.5,
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
              title: Text('عن المخيم',
                  style: GoogleFonts.cairo(
                      fontWeight: FontWeight.bold, fontSize: 13)),
              trailing: Icon(
                Icons.keyboard_arrow_left,
                color: Colors.black38,
              ),
              leading: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10),
                  color: Colors.grey.shade200,
                ),
                height: 35,
                width: 35,
                child:Icon(
                  Icons.info_outline,
                  color: Colors.black,
                ),
              ),
            ),
            Divider(
              indent: 20,
              endIndent: 20,
              thickness: 0.5,
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/bladyeMassage');
              },
              title: Text('رسالة البلدية',
                  style: GoogleFonts.cairo(
                      fontWeight: FontWeight.bold, fontSize: 13)),
              trailing: Icon(
                Icons.keyboard_arrow_left,
                color: Colors.black38,
              ),
              leading: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10),
                  color: Colors.grey.shade200,
                ),
                height: 30,
                width: 30,
                child: Icon(Icons.groups, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
