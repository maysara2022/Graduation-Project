import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/firebase/ComplaintController.dart';
import 'package:graduationproject/models/complaintTest.dart';
import 'package:graduationproject/prefs/shared_pref_controller.dart';

class ComplaintPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String userId =
    SharedPrefController().getValue<String>(key: PrefKeys.userId.name)!;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: Navigator.of(context).pop,
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.transparent,
          title: Text(
            'الشكاوي',
            style: GoogleFonts.cairo(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: StreamBuilder<QuerySnapshot<TestMays>>(
            stream: ComlaintController().readdata(userId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, Index) {
                    return Padding(
                      padding:  const EdgeInsets.all(8.0).r,
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15).r,
                            side: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1.w,
                            )),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 250.h,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15).r,
                                child: Image.network(snapshot.data!.docs[Index]
                                    .data()
                                    .imageUrl
                                    .toString(),
                                  fit: BoxFit.cover,),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 6),
                              child: Row(
                                children: [
                                  Text(
                                    'حالة الشكوى :',
                                    style: GoogleFonts.cairo(
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15).r,
                                        color: Colors.red.shade400,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0).r,
                                        child: Text(snapshot.data!.docs[Index]
                                            .data()
                                            .status
                                            .toString(),
                                            style: GoogleFonts.cairo()),
                                      ))
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 30).w,
                              child: Row(
                                children: [
                                  Text(
                                    'نوع الشكوى :',
                                    style: GoogleFonts.cairo(fontSize: 16.sp,),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0).w,
                                    child: Text(snapshot.data!.docs[Index]
                                        .data()
                                        .type
                                        .toString(),
                                        style: GoogleFonts.cairo()),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 6).w,
                              child: Row(
                                children: [
                                  Text(
                                    'منطقة الشكوى :',
                                    style: GoogleFonts.cairo(fontSize: 16.sp),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0).w,
                                    child: Text(snapshot.data!.docs[Index]
                                        .data()
                                        .address
                                        .toString(),
                                        style: GoogleFonts.cairo()),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text('لا يوجد بيانات'),
                );
              }
            }),
        floatingActionButton: SizedBox(
          width: 70.w,
          height: 70.h,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/Complaintscreen');
            },
            backgroundColor: const Color(0xFF820000),
            child: const Icon(Icons.add, size: 35),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      ),
    );
  }
}
//
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:graduationproject/firebase/ComplaintController.dart';
// import 'package:graduationproject/models/complaintTest.dart';
// import 'package:graduationproject/prefs/shared_pref_controller.dart';
//
// class ComplaintPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     String userId =
//     SharedPrefController().getValue<String>(key: PrefKeys.userId.name)!;
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           leading: IconButton(
//             onPressed: Navigator.of(context).pop,
//             icon: const Icon(
//               Icons.arrow_back_ios,
//               color: Colors.black,
//             ),
//           ),
//           backgroundColor: Colors.transparent,
//           title: Text(
//             'الشكاوي',
//             style: GoogleFonts.cairo(color: Colors.black),
//           ),
//           centerTitle: true,
//         ),
//         body: StreamBuilder<QuerySnapshot<TestMays>>(
//             stream: ComlaintController().readdata(userId),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
//                 return ListView.builder(
//                   itemCount: snapshot.data!.docs.length,
//                   itemBuilder: (context, Index) {
//                     return ListTile(
//                       leading: CircleAvatar(
//                         backgroundImage: NetworkImage(snapshot.data!.docs[Index]
//                             .data()
//                             .imageUrl
//                             .toString()),
//                       ),
//                       title: Text(
//                         snapshot.data!.docs[Index].data().title.toString(),
//                         style: GoogleFonts.cairo(color: Colors.black),
//                       ),
//                       subtitle: Text(snapshot.data!.docs[Index]
//                           .data()
//                           .description
//                           .toString()),
//                     );
//                   },
//                 );
//               } else {
//                 return Center(
//                   child:Text('لا يوجد بيانات'),
//                 );
//               }
//             }),
//         floatingActionButton: SizedBox(
//           width: 70,
//           height: 70,
//           child: FloatingActionButton(
//             onPressed: () {
//               Navigator.pushNamed(context, '/Complaintscreen');
//             },
//             backgroundColor: Color(0xFF820000),
//             child: const Icon(Icons.add, size: 35),
//           ),
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
//       ),
//     );
//   }
// }