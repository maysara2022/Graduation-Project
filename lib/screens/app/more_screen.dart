import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/prefs/shared_pref_controller.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'المزيد',
            style: GoogleFonts.cairo(color: Colors.black),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu,),
          ),
        ),
        body: Column(
          children: [
            Divider(indent: 20,endIndent: 20,thickness: 0.5,),
            SizedBox(height: 20.h,),
            ListTile(
              onTap: (){
                bool loggedIn = SharedPrefController()
                    .getValue<bool>(key: PrefKeys.loggedIn.name) ??
                    false;
                String rout = loggedIn ? '/fatora_screen' : '/sign_in';
                Navigator.pushNamed(context, rout);
              },
              title: Text('فاتورتي',style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 13.sp)),
              trailing: Icon(Icons.keyboard_arrow_left,color: Colors.black38,),
              leading: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10.r),
                  color: Colors.grey.shade200,
                ),
                height: 30.h,
                width: 30.w,
                child: Icon(Icons.content_paste_rounded,color: Colors.black),
              ),
            ),
            Divider(indent: 20,endIndent: 20,thickness: 0.5,),
            ListTile(
              onTap: (){
                Navigator.pushNamed(context, '/moreOfMore');
              },
              title: Text('رؤية البلدية',style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 13)),
              trailing: Icon(Icons.keyboard_arrow_left,color: Colors.black38,),
              leading: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10.r),
                  color: Colors.grey.shade200,
                ),
                height: 35.h,
                width: 35.w,
                child:ImageIcon(AssetImage('images/targeting.png'),color: Colors.black),
              ),
            ),
            Divider(indent: 20,endIndent: 20,thickness: 0.5,),
            ListTile(
              onTap: (){
                Navigator.pushNamed(context, '/myTapBar');
              },
              title: Text('المجلس البلدي',style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 13.sp)),
              trailing: Icon(Icons.keyboard_arrow_left,color: Colors.black38,),
              leading: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10.r),
                  color: Colors.grey.shade200,
                ),
                height: 30,
                width: 30,
                child: Icon(Icons.groups,color: Colors.black),
              ),
            ),
            Divider(indent: 20,endIndent: 20,thickness: 0.5,),
            ListTile(
              onTap: (){
                Navigator.pushNamed(context, '/emergency_screen');
              },
              title: Text('أرقام تهمك',style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 13.sp)),
              trailing: Icon(Icons.keyboard_arrow_left,color: Colors.black38,),
              leading: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10.r),
                  color: Colors.grey.shade200,
                ),
                height: 30.h,
                width: 30.w,
                child: Icon(Icons.call_outlined,color: Colors.black),
              ),
            ),
            Divider(indent: 20,endIndent: 20,thickness: 0.5,),
            ListTile(
              title: Text('اتصل بنا',style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 13.sp)),
              trailing: Icon(Icons.keyboard_arrow_left,color: Colors.black38),
              leading: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10.r),
                  color: Colors.grey.shade200,
                ),
                height: 30.h,
                width: 30.w,
                child: Icon(Icons.email_outlined,color: Colors.black),
              ),
            ),
            Divider(indent: 20,endIndent: 20,thickness: 0.5,),
            ListTile(
              title: Text('الأسئلة الشائعة',style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 13.sp)),
              trailing: Icon(Icons.keyboard_arrow_left,color: Colors.black38),
              leading: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10.r),
                  color: Colors.grey.shade200,
                ),
                height: 30.h,
                width: 30.w,
                child: Icon(Icons.question_mark,color: Colors.black),
              ),
            ),
            Divider(indent: 20,endIndent: 20,thickness: 0.5,),
            ListTile(
              title: Text('تسجيل الدخول',style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 13.sp,color: Colors.red)),
              trailing: Icon(Icons.keyboard_arrow_left,color: Colors.black38),
              leading: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10.r),
                  color: Colors.grey.shade200,
                ),
                height: 30.h,
                width: 30.w,
                child: Icon(Icons.login_outlined,color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}