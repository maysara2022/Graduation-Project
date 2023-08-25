import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/firebase/fb_firstore_controller.dart';
import 'package:graduationproject/models/expense.dart';
import 'package:graduationproject/models/modelAds.dart';
import 'package:intl/intl.dart' as intl;

class LastAds extends StatefulWidget {
  const LastAds({Key? key}) : super(key: key);

  @override
  State<LastAds> createState() => _LastAds();
}

class _LastAds extends State<LastAds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            "أخر الإعلانات",
            style: GoogleFonts.cairo(fontSize: 22.sp, color: Colors.black),
          ),
        ),
        body: StreamBuilder<QuerySnapshot<ModelAds>>(
            stream: FbFirstoreController().adsRead(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                return ListView.builder
                  (itemCount: snapshot.data!.docs.length,
                    itemBuilder:
                        (context, Index) {

                      DateTime t =
                      snapshot.data!.docs[Index].
                      data().time!.toDate();

                      var output1 = intl.DateFormat('dd/MM/2023').format(t);

                      return Column(children: [
                        SizedBox(
                          height: 30.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10).w,
                          child: Row(children: [
                            Icon(
                              Icons.access_time_sharp,
                              color: Colors.black,
                              size: 20,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              overflow: TextOverflow.ellipsis,
                              output1,
                              style: GoogleFonts.changa(
                                color: Colors.redAccent,
                              ),
                            )
                          ]),
                        ),


                        Padding(
                          padding: const EdgeInsets.only(right: 20),

                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                maxLines: 2,
                                snapshot.data!.docs[Index].data().title.toString(),
                                style: GoogleFonts.cairo(fontSize: 18.sp,fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                maxLines: 2,
                                snapshot.data!.docs[Index].data().content.toString(),
                                style: GoogleFonts.cairo(fontSize: 14.sp),
                              ),
                            ],
                          ),
                        ),


                      ]);
                    });
              } else {
                return Center(
                  child: Text(
                    'لا يوجد بيانات',
                    style: GoogleFonts.cairo(fontWeight: FontWeight.bold),
                  ),
                );
              }
            }));
  }
}