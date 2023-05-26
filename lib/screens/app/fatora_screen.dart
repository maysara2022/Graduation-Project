import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
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
        backgroundColor: Color(0xFF820000),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        actions: [
          Visibility(
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.logout),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
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
                          height: 140,
                          decoration: BoxDecoration(
                              color: Color(0xFF820000),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(50),
                                  bottomRight: Radius.circular(50))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Center(
                              child: Text(
                            'قيمة متأخراتك لدى البلدية :',
                            style: GoogleFonts.cairo(
                                color: Colors.white,
                                fontSize: 22,
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
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.black12)),
                        selectedTileColor: Colors.cyan,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                        leading: ImageIcon(
                          AssetImage('images/dial-pad.png'),
                          color: Colors.black,
                          size: 30,
                        ),
                        title: Text(
                          'رقم الإشتراك',
                          style: GoogleFonts.cairo(
                              fontSize: 15, color: Colors.black),
                        ),
                        subtitle: Text(
                          snapshot.data!.docs[0]
                              .data()
                              .subscriptionNumber
                              .toString(),
                          style: GoogleFonts.cairo(
                              fontSize: 20, color: Colors.black),
                        ),
                        trailing: Icon(
                          Icons.numbers,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 2, color: Colors.grey.shade300),
                          borderRadius: BorderRadiusDirectional.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(Icons.numbers),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'قيمة الفاتورة الحالية : ',
                                style: GoogleFonts.cairo(fontSize: 20),
                              ),
                              Spacer(),
                              Text(
                                snapshot.data!.docs[0]
                                        .data()
                                        .currentBillValue
                                        .toString() +
                                    "  شيكل",
                                style: GoogleFonts.cairo(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 2, color: Colors.grey.shade300),
                          borderRadius: BorderRadiusDirectional.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(Icons.numbers),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'فاتورة الشهر السابق :',
                                style: GoogleFonts.cairo(fontSize: 20),
                              ),
                              Spacer(),
                              Text(
                                snapshot.data!.docs[0]
                                        .data()
                                        .month1
                                        .toString() +
                                    "  شيكل",
                                style: GoogleFonts.cairo(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 2, color: Colors.grey.shade300),
                          borderRadius: BorderRadiusDirectional.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(Icons.numbers),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                ' الفاتورة الشهر الأسبق  :',
                                style: GoogleFonts.cairo(fontSize: 20),
                              ),
                              Spacer(),
                              Text(
                                snapshot.data!.docs[0]
                                        .data()
                                        .month2
                                        .toString() +
                                    "  شيكل",
                                style: GoogleFonts.cairo(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 2, color: Colors.grey.shade300),
                          borderRadius: BorderRadiusDirectional.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.numbers,
                                size: 28,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'إجمالي الفواتير :',
                                style: GoogleFonts.cairo(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Text(
                                snapshot.data!.docs[0]
                                        .data()
                                        .arrearsValue
                                        .toString() +
                                    "  شيكل",
                                style: GoogleFonts.cairo(
                                    fontSize: 15, fontWeight: FontWeight.bold),
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
