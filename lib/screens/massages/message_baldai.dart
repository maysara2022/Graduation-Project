import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class message_Baldia extends StatelessWidget {
  const message_Baldia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: Navigator.of(context).pop,
          ),
          backgroundColor: Color(0xFF820000),
          centerTitle: true,
          title: Text(
            'رؤية ورسالة البلدية',
            style: GoogleFonts.cairo(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),

                Text(
                  'نحو مجتمع راقٍ في بيئة صحية يتوفر فيها بنية تحتية متطورة وخدمات كافية مع تعزيز فرص الاستثمار المحلي. \n '
                      'توفير خدمات أساسية للمجتمع المحلي، بما في ذلك الصرف الصحي والنظافة والإضاءة والنقل العام والطرق والبنية التحتية والتنمية الاقتصادية والاجتماعية. وبالتالي، يمكن أن تكون رؤية البلدية هي توفير بيئة حياة مستدامة وصحية وآمنة وجاذبة للمواطنين، بينما تكون رسالتها هي تقديم خدمات عالية الجودة للمجتمع المحلي وتحسين مستوى الحياة للمواطنينين \n '
                      'رؤية ورسالة البلدية ترتكز على تلبية احتياجات المجتمع المحلي وتحسين مستوى الحياة للمواطنين، وتحقيق التنمية المستدامة والمساهمة في نمو الاقتصاد المحلي وتعزيز الهوية والثقافة المحلية.\n',
                  style: GoogleFonts.cairo(fontWeight: FontWeight.bold),
                ),
                Center(
                  child: Text(
                    'بلدية المغازي',
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}