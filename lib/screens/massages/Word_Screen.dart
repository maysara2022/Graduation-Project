import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class WordScreen extends StatelessWidget {
  const WordScreen({Key? key}) : super(key: key);

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
            'كلمة رئيس البلدية',
            style: GoogleFonts.cairo(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  width: double.infinity,
                  height: 300.h,
                  child: Image.asset('images/hatam.jpg'),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'تشرفنا في شهر يونيو لعام 2020 بأن تم تكليفنا برئاسة هذه المؤسسة الوطنية الشامخة ومنذ أن بدأنا العمل في هذه المؤسسة أخذنا على عاتقنا بأن نبذل قصارى جهدنا من أجل النهوض بالمخيم والعمل على تلبية جميع الاحتياجات سواء كانت في صميم عمل البلدية أو حتى غير ذلك. \n '
                      'نعمل هنا في البلدية بروح الفريق مع المجلس البلدي وكادر الموظفين من أجل الوصول بأقصى سرعة للأهداف التي نراها ونأمل الوصول إليها، وكذلك نعمل سويا على المفاهيم والقيم السامية من حيث التعامل المتبادل بين المواطنين والبلدية مما لهذا دور كبير في رقي المخيم والنهوض به. ونوظف أيضا جميع الإمكانيات المتاحة من أجل الوصول الي درجة الرضا من الله أولا ثم المواطن وذلك عبر الاهتمام بعدة مجالات سواء كانت خدماتية، تعليمية، صحة، وأمنية. ونهتم بتطبيق القوانين دون تميز أو محسوبية أو حزبية من أجل المساواة والعدالة في جميع الأمور، ونعمل أيضا على إزالة التعديات بقوة القانون. \n '
                      'وللنهوض بالبلدية والمخيم نملك نظرة مستقبلية نسعى جاهدين لتحقيقها حيث أنه يتوافر لدينا أفكار مشاريع تعمل على إيجاد خدمة نوعية للمواطن وكذلك نعمل على إيجاد طرق مناسبة من أجل تنفيذها سواء كان عبر التواصل مع الجهات المانحة أو البحث عن تمويل ذاتي محلي. ونسعى كذلك لتطوير الكادر العامل في البلدية وبناء المؤسسة على أساس علمي حديث يواكب التطور الحاصل في العالم. وسنقوم بحل جميع الإشكاليات القديمة التي تتمثل في ملفات الوفيات والملكيات والموظفين وإيجاد حلول مناسبة لكل شريحة على حدى. \n'
                      'وختاماً، فإنني أؤكد أن بلدية المغازي ستكون دوما هي اللبنة الأساسية لمؤسسات المخيم وتعمل على تطوير هذه المؤسسات من أجل مخيم المغازي الحبيب. \n',
                  style: GoogleFonts.cairo(fontWeight: FontWeight.bold),
                ),
                Center(
                  child: Text(
                    'والسلام عليكم ورحمة الله وبركاته.\n',
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