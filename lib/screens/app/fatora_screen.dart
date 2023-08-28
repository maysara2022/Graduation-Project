import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/firebase/fb_firstore_controller.dart';
import 'package:graduationproject/models/usersData.dart';
import 'package:graduationproject/prefs/shared_pref_controller.dart';

class FatoraScreen extends StatefulWidget {
  FatoraScreen({Key? key}) : super(key: key);

  @override
  State<FatoraScreen> createState() => _FatoraScreenState();
}

String maysara =
SharedPrefController().getValue<String>(key: PrefKeys.sub.name)!;

class _FatoraScreenState extends State<FatoraScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF820000),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        actions: [
          Visibility(
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.logout),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
        elevation: 0,
        title: Text(
          'الفواتير',
          style: GoogleFonts.cairo(),
        ),
      ),
      body: StreamBuilder<QuerySnapshot<userData>>(
          stream: FbFirstoreController().userDataRead(maysara as dynamic),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
              snapshot.data!.docs[0].data().subscriptionNumber.toString();
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 140.h,
                          decoration: BoxDecoration(
                              color: const Color(0xFF820000),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: const Radius.circular(50).r,
                                  bottomRight: const Radius.circular(50).r)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Center(
                              child: Text(
                                'قيمة متأخراتك لدى البلدية :',
                                style: GoogleFonts.cairo(
                                    color: Colors.white,
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w600),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 65),
                          child: Center(
                              child: Text(
                                snapshot.data!.docs[0]
                                    .data()
                                    .arrearsValue
                                    .toString()+"  شيكل",
                                style: GoogleFonts.cairo(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600),
                              )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14).w,
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10).r,
                            side: const BorderSide(color: Colors.black12)),
                        selectedTileColor: Colors.cyan,
                        contentPadding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                        leading: const ImageIcon(
                          AssetImage('images/dial-pad.png'),
                          color: Colors.black,
                          size: 30,
                        ),
                        title: Text(
                          'رقم الإشتراك',
                          style: GoogleFonts.cairo(
                              fontSize: 15.sp, color: Colors.black),
                        ),
                        subtitle: Text(
                          snapshot.data!.docs[0]
                              .data()
                              .subscriptionNumber
                              .toString(),
                          style: GoogleFonts.cairo(
                              fontSize: 20.sp, color: Colors.black),
                        ),
                        trailing: const Icon(
                          Icons.numbers,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0).w,
                      child: Container(
                        width: double.infinity,
                        height: 60.h,
                        decoration: BoxDecoration(
                          border:
                          Border.all(width: 2.w, color: Colors.grey.shade300),
                          borderRadius: BorderRadiusDirectional.circular(10.r),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0).w,
                          child: Row(
                            children: [
                              const Icon(Icons.numbers),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                'قيمة الفاتورة الحالية : ',
                                style: GoogleFonts.cairo(fontSize: 20.sp),
                              ),
                              const Spacer(),
                              Text(
                                snapshot.data!.docs[0]
                                    .data()
                                    .currentBillValue
                                    .toString() +
                                    "  شيكل",
                                style: GoogleFonts.cairo(
                                    fontSize: 15.sp, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        height: 60.h,
                        decoration: BoxDecoration(
                          border:
                          Border.all(width: 2.w, color: Colors.grey.shade300),
                          borderRadius: BorderRadiusDirectional.circular(10.r),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0).w,
                          child: Row(
                            children: [
                              const Icon(Icons.numbers),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                'فاتورة الشهر السابق :',
                                style: GoogleFonts.cairo(fontSize: 20.sp),
                              ),
                              const Spacer(),
                              Text(
                                snapshot.data!.docs[0]
                                    .data()
                                    .month1
                                    .toString() +
                                    "  شيكل",
                                style: GoogleFonts.cairo(fontSize: 15.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0).r,
                      child: Container(
                        width: double.infinity,
                        height: 60.h,
                        decoration: BoxDecoration(
                          border:
                          Border.all(width: 2.w, color: Colors.grey.shade300),
                          borderRadius: BorderRadiusDirectional.circular(10.r),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0).w,
                          child: Row(
                            children: [
                              const Icon(Icons.numbers),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                ' الفاتورة الشهر الأسبق  :',
                                style: GoogleFonts.cairo(fontSize: 20.sp),
                              ),
                              const Spacer(),
                              Text(
                                snapshot.data!.docs[0]
                                    .data()
                                    .month2
                                    .toString() +
                                    "  شيكل",
                                style: GoogleFonts.cairo(fontSize: 15.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0).r,
                      child: Container(
                        width: double.infinity,
                        height: 60.h,
                        decoration: BoxDecoration(
                          border:
                          Border.all(width: 2.w, color: Colors.grey.shade300),
                          borderRadius: BorderRadiusDirectional.circular(10.r),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0).r,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.numbers,
                                size: 28,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                'إجمالي الفواتير :',
                                style: GoogleFonts.cairo(
                                    fontSize: 20.sp, fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              Text(
                                snapshot.data!.docs[0]
                                    .data()
                                    .arrearsValue
                                    .toString() +
                                    "  شيكل",
                                style: GoogleFonts.cairo(
                                    fontSize: 15.sp, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: Text(
                  'لا يوجد بيانات',
                  style: GoogleFonts.cairo(fontWeight: FontWeight.bold),
                ),
              );
            }
          }),
    );
  }
}