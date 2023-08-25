import 'dart:async';
import 'dart:ui' as ui;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/firebase/fb_auth_controller.dart';
import 'package:graduationproject/firebase/fb_firstore_controller.dart';
import 'package:graduationproject/models/expense.dart';
import 'package:graduationproject/models/modelAds.dart';
import 'package:graduationproject/prefs/shared_pref_controller.dart';
import 'package:graduationproject/widgets/icon_column.dart';
import 'package:graduationproject/widgets/listDetalis.dart';
import 'package:intl/intl.dart' as intl;
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int _currentPage = 0;
bool loggedIn = SharedPrefController().getValue<bool>(key: PrefKeys.loggedIn.name) ?? false;
bool rout = loggedIn;
PageController _pageController = PageController(
  initialPage: 0,
);

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFF820000),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
          ),
          actions: [
            Visibility(
              visible: rout,
              child: IconButton(
                onPressed: () async {
                  _confirmLogOut();
                },
                icon: Icon(Icons.logout),
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Unavilable');
              },
              icon: Icon(Icons.search),
            ),
          ],
          elevation: 0,
          title: Text(
            'الرئيسية',
            style: GoogleFonts.cairo(),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 140.h,
                    decoration: BoxDecoration(
                        color: Color(0xFF820000),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15.r),
                            bottomRight: Radius.circular(15.r))),
                  ),
                  StreamBuilder<QuerySnapshot<Expense>>(
                      stream: FbFirstoreController().read(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasData &&
                            snapshot.data!.docs.isNotEmpty) {
                          return CarouselSlider.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, Index, int pageViewIndex) =>
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  clipBehavior: Clip.antiAlias,
                                  height: 10.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  child: Image.network(
                                      snapshot.data!.docs[Index]
                                          .data()
                                          .imageUrl
                                          .toString(),
                                      fit: BoxFit.cover),
                                ),
                            options: CarouselOptions(
                              autoPlay: true,
                              viewportFraction: .98,
                              autoPlayInterval: Duration(seconds: 5),
                              enlargeCenterPage: true,
                              aspectRatio: 1.7,
                              initialPage: 3,
                            ),
                          );
                        } else {
                          return Center(
                            child: Text(
                              'لا يوجد بيانات',
                              style: GoogleFonts.cairo(
                                  fontWeight: FontWeight.bold),
                            ),
                          );
                        }
                      }),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconColumn(
                      icon3: 'images/validating-ticket.png',
                      texticon: 'فاتورتي',
                      fun: () {
                        bool loggedIn = SharedPrefController()
                            .getValue<bool>(key: PrefKeys.loggedIn.name) ??
                            false;
                        String rout = loggedIn ? '/fatora_screen' : '/Unavilable';
                        Navigator.pushNamed(context, rout);
                      },
                    ),
                    IconColumn(
                      icon3: 'images/icons8-whatsapp-96.png',
                      texticon: 'أونلاين شات',
                      fun: () {
                        String number = '+972599633588';
                        String whatsApp =
                            "whatsapp://send?phone=$number&text=مرحبا ,, أحتاج مساعدة ";
                        launchUrl(Uri.parse(whatsApp));
                      },
                    ),
                    IconColumn(
                      icon3: 'images/call-center.png',
                      texticon: 'أرقام الطورائ',
                      fun: () {
                        Navigator.pushNamed(context, '/emergency_screen');
                      },
                    ),
                    IconColumn(
                      icon3: 'images/web.png',
                      texticon: 'موقعنا الإلكتروني',
                      fun: () {
                        final Uri url = Uri.parse('https://maghazi.mun.ps/');
                        launchUrl(url);
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Column(
                  children: [
                    ListDetails(
                        type: 'الأخبار',
                        fun: () {
                          Navigator.pushNamed(context, '/lastNews_screen');
                        }),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: 140.h),
                      child: StreamBuilder<QuerySnapshot<Expense>>(
                          stream: FbFirstoreController().read(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasData &&
                                snapshot.data!.docs.isNotEmpty) {
                              return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 3,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Container(
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadiusDirectional.circular(
                                              15.r),
                                        ),
                                        width: 300.w,
                                        child: Stack(
                                          children: [
                                            Opacity(
                                                opacity: 0.9,
                                                child: Image.network(
                                                  snapshot.data!.docs[index]
                                                      .data()
                                                      .imageUrl
                                                      .toString(),
                                                  fit: BoxFit.cover,
                                                  height: 140.h,
                                                  width: 300.w,
                                                )),
                                            Positioned(
                                              width: 270.w,
                                              bottom: 5,
                                              right: 8,
                                              child: Text(
                                                snapshot.data!.docs[index]
                                                    .data()
                                                    .title
                                                    .toString(),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                style: GoogleFonts.cairo(
                                                    fontSize: 15.sp,
                                                    color: Colors.white,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            } else {
                              return Center(
                                child: Text(
                                  'لا يوجد بيانات',
                                  style: GoogleFonts.cairo(
                                      fontWeight: FontWeight.bold),
                                ),
                              );
                            }
                          }),
                    ),
                    ListDetails(
                        type: 'الإعلانات',
                        fun: () {
                          Navigator.pushNamed(context, '/lastAds');
                        }),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: 100.h),
                      child: StreamBuilder<QuerySnapshot<ModelAds>>(
                          stream: FbFirstoreController().adsRead(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasData &&
                                snapshot.data!.docs.isNotEmpty) {
                              return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    DateTime t = snapshot.data!.docs[index]
                                        .data()
                                        .time!
                                        .toDate();
                                    var output1 =
                                    intl.DateFormat('dd/MM/2023').format(t);

                                    return Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey.shade300),
                                        borderRadius:
                                        BorderRadiusDirectional.circular(
                                            10.r),
                                      ),
                                      margin: EdgeInsetsDirectional.symmetric(
                                          horizontal: 7),
                                      width: 260.w,
                                      child: Padding(
                                        padding: EdgeInsets.all(5.0).w,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              snapshot.data!.docs[index]
                                                  .data()
                                                  .title
                                                  .toString(),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: GoogleFonts.cairo(
                                                fontSize: 15.sp,
                                              ),
                                            ),
                                            Spacer(),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.access_time_sharp,
                                                  color: Colors.black,
                                                  size: 20,
                                                ),
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                                Text(
                                                  output1,
                                                  style: GoogleFonts.changa(
                                                    color: Colors.redAccent,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            } else {
                              return Center(
                                  child: Text(
                                    'لا يوجد بيانات',
                                    style: GoogleFonts.cairo(
                                        fontWeight: FontWeight.bold),
                                  ));
                            }
                          }),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _confirmLogOut() async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: EdgeInsets.only(top: 0, right: 9),
            title: Text(
              'هل أنت مُتأكد ؟',
              style:
              GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 14.sp),
            ),
            content: Text(
              'تسجيل الخروج من الحساب.',
              style: GoogleFonts.cairo(color: Colors.black45, fontSize: 14.sp),
            ),
            actions: [
              TextButton(
                  onPressed: () async {

                    bool cleard = await SharedPrefController().clear();
                    if (cleard) {
                      Navigator.pushReplacementNamed(context, '/sign_in');
                      rout = false;
                    }
                  },
                  child: Text(
                    'نعم',
                    style: GoogleFonts.cairo(color: Colors.red, fontSize: 12.sp),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: Text(
                    'رجوع',
                    style: GoogleFonts.cairo(fontSize: 12.sp),
                  )),
            ],
          );
        });
  }

}