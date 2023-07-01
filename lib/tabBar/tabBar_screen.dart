import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/widgets/personsBaladea.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              leading: IconButton(
                onPressed: Navigator.of(context).pop,
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              elevation: 0,
              backgroundColor: Colors.white,
              bottom: TabBar(
                indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
                indicatorWeight: 5,
                indicatorColor: Color(0xFF820000),
                tabs: [
                  Tab(
                      child: Text(
                    'المجلس الحالي ',
                    style:
                        GoogleFonts.cairo(color: Colors.black45, fontSize: 18),
                  )),
                  Tab(
                      child: Text(
                    'أعضاء المجلس ',
                    style:
                        GoogleFonts.cairo(color: Colors.black45, fontSize: 18),
                  )),
                ],
              ),
              title: Text(
                'المجلس البلدي',
                style: GoogleFonts.cairo(color: Colors.black),
              ), 
            ),

            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: TabBarView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('images/اmgles2023.jpg'),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'المجلس البلدي الحالي',
                        style: GoogleFonts.cairo(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'تسلم المجلس البلدي إدارة بلدية المغازي مطلع يونيو 2020، في وقت تعاني فيه البلدية أزمة مالية كبيرة وقلة في الموارد والإمكانات. ويضم المجلس البلدي 11 عضوا نشيطا يحملون شهادات ودرجات علمية عالية في تخصصات متنوعة، يمثلون أحياء ومناطق المخيم، ولديهم الرغبة والدافعية للنهوض بواقع مخيم المغازي وبلديته لتصبح البيت الحاضن للجميع. ويعمل المجلس البلدي على تحديد السياسات التي تحكم عمل البلدية، ويوفر الإشراف والمساءلة من خلال لجان متخصصة للمجلس إلى جانب الإجتماعات الدورية مع كوادر البلدية.',
                        style: GoogleFonts.cairo(fontSize: 16),
                      )
                    ],
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        persons(
                            title: 'أ.حاتم صالح الغمري - رئيس البلدية',
                            suptilte:
                                'ماجستير في الفيزياء التجريبية في الجامعة \nالإسلامية بغزة',
                            ImageUrL:
                                'https://maghazi.mun.ps/wp-content/uploads/2021/03/%D8%B5%D8%A7%D9%84%D8%AD-%D8%A7%D9%84%D8%BA%D9%85%D8%B1%D9%8A-150x150.jpg'),
                        persons(
                            title: 'محمد صبري مصلح - نائب رئيس البلدية',
                            suptilte:
                                'ماجستير في العلوم البيئية في الجامعة \nالإسلامية بغزة',
                            ImageUrL:
                                'https://maghazi.mun.ps/wp-content/uploads/2021/03/%D9%85%D8%AD%D9%85%D8%AF-%D9%85%D8%B5%D9%84%D8%AD-200x300-1-150x150.jpg'),
                        persons(
                            title: 'عاطف سامي قنديل - أمين السر',
                            suptilte:
                                'رئيس قسم البرامج والتطوير  بكالوريوس \n الهندسة المدنية الجامعة الإسلامية بغزة',
                            ImageUrL:
                                'https://maghazi.mun.ps/wp-content/uploads/2021/03/%D8%B9%D8%A7%D8%B7%D9%81-%D9%82%D9%86%D8%AF%D9%8A%D9%84-150x150.jpg'),
                        persons(
                            title: 'أحمد غانم أبو سعيد',
                            suptilte:
                                'رئيس شعبة الكراج والاليات في البلدية سابقا\n عضو  بلدية سابق',
                            ImageUrL:
                                'https://maghazi.mun.ps/wp-content/uploads/2021/03/%D8%A7%D8%AD%D9%85%D8%AF-%D8%A7%D8%A8%D9%88-%D8%A7%D8%B3%D8%B9%D9%8A%D8%AF-150x150.jpg'),
                        persons(
                            title: 'أ.أيمن محمد أبو كريم - عضو مجلس بلدي',
                            suptilte:
                                'ماجستير إدارة أعمال كلية الإقتصاد  \nوالعلوم الادارية جامعة الأزهر بغزة',
                            ImageUrL:
                                'https://maghazi.mun.ps/wp-content/uploads/2021/03/%D8%A7%D9%8A%D9%85%D9%86-%D8%A7%D8%A8%D9%88-%D9%83%D8%B1%D9%8A%D9%85-150x150.jpg'),
                        persons(
                            title: 'صالح مسلم مسلم - عضو مجلس بلدي',
                            suptilte:
                                'بكالويوس في المحاسبة المالية \nجامعة الأزهر بغزة ',
                            ImageUrL:
                                'https://maghazi.mun.ps/wp-content/uploads/2021/03/11-1-1-150x150.jpg'),
                        persons(
                            title: 'إياد عبد العادي بر- عضو مجلس بلدي',
                            suptilte:
                                'بكالوريوس علوم زراعية عضو مجلس إدارة دار \nالقران الكريم',
                            ImageUrL:
                                'https://maghazi.mun.ps/wp-content/uploads/2021/03/12-1-1-150x150.jpg'),
                        persons(
                            title: 'أ.عبدالله الخواص - عضو مجلس بلدي',
                            suptilte: 'معلم متقاعد',
                            ImageUrL:
                                'https://maghazi.mun.ps/wp-content/uploads/2021/03/%D8%B9%D8%A8%D8%AF%D8%A7%D9%84%D9%84%D9%87-%D8%A7%D9%84%D8%AE%D9%88%D8%A7%D8%B5-150x150.jpg'),
                        persons(
                            title: 'خديجة أبو جياب - عضو مجلس بلدي',
                            suptilte:
                                'ماجستير حديث شريف وعلومه الجامعة \nالإسلامية بغزة',
                            ImageUrL:
                                'https://maghazi.mun.ps/wp-content/uploads/2021/03/%D8%AE%D8%AF%D9%8A%D8%AC%D8%A9-%D8%A7%D8%A8%D9%88-%D8%AC%D9%8A%D8%A7%D8%A8-150x150.jpg'),
                        persons(
                            title: 'امال محمد التلباني - عضو مجلس بلدي',
                            suptilte:
                                'ماجستير مناهج وطرق تدريس الجامعة \n الاسلامية بغزة ',
                            ImageUrL:
                                'https://maghazi.mun.ps/wp-content/uploads/2021/03/%D8%A2%D9%85%D8%A7%D9%84-%D8%A7%D9%84%D8%AA%D9%84%D8%A8%D8%A7%D9%86%D9%8A-150x150.jpg'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
