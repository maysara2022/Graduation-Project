import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/firebase/fb_firstore_controller.dart';
import 'package:graduationproject/models/expense.dart';
import 'package:intl/intl.dart' as intl;

class LastNews extends StatefulWidget {
  const LastNews({Key? key}) : super(key: key);

  @override
  State<LastNews> createState() => _LastNewsState();
}

class _LastNewsState extends State<LastNews> {
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
            "أخر الأخبار",
            style: GoogleFonts.cairo(fontSize: 22, color: Colors.black),
          ),
        ),
        body: StreamBuilder<QuerySnapshot<Expense>>(
            stream: FbFirstoreController().read(),
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
                  snapshot.data!.docs[Index].data().time!.toDate();

                  var output1 = intl.DateFormat('dd/MM/2023').format(t);

                  return Column(children: [
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      clipBehavior: Clip.antiAlias,
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.network(
                        fit: BoxFit.cover,
                        snapshot.data!.docs[Index].data().imageUrl.toString(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(children: [
                        Icon(
                          Icons.access_time_sharp,
                          color: Colors.black,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            maxLines: 2,
                            snapshot.data!.docs[Index].data().title.toString(),
                            style: GoogleFonts.cairo(fontSize: 18,fontWeight: FontWeight.w600),
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
                            style: GoogleFonts.cairo(fontSize: 14),
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
