import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/widgets/emergencyItems.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: Navigator.of(context).pop,
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            "أرقام الطوارئ",
            style: GoogleFonts.cairo(fontSize: 22.sp, color: Colors.black),
          ),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              EmergencyItems(
                title: 'هواتف خدمات البلدية',
                det: 'المركز الرئيسي - المغازي شارع السكة : 2854442' +
                    "\n" +
                    'العلاقات العامة : 0597744512' +
                    '\n' 'التواصل الإعلامي : 0598077514',
              ),
              EmergencyItems(
                title: 'أرقام الطورائ',
                det: ' الشرطة الفلسطينية : 100 ' +
                    "\n" +
                    'الإسعاف والطوارئ : 101' +
                    '\n'
                        'الدفاع المدني : 102'
                        '\n'
                        'مركز العمليات : 109',
              ),
              EmergencyItems(
                title: 'مراكز التحصيل الخارجية',
                det: 'المركز الرئيسي - المغازي شارع السكة ' +
                    "\n" +
                    'المغازي - شارع السوق بجوار صالة التأهيل' +
                    '\n' 'المغازي شارع السوق مركز عابد للخدمات',
              ),
            ],
          ),
        ),
      ),
    );
  }
}