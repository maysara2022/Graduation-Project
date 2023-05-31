import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(snapshot.data!.docs[Index]
                            .data()
                            .imageUrl
                            .toString()),
                      ),
                      title: Text(
                        snapshot.data!.docs[Index].data().title.toString(),
                        style: GoogleFonts.cairo(color: Colors.black),
                      ),
                      subtitle: Text(snapshot.data!.docs[Index]
                          .data()
                          .description
                          .toString()),
                    );
                  },
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
        floatingActionButton: SizedBox(
          width: 70,
          height: 70,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/Complaintscreen');
            },
            backgroundColor: Color(0xFF820000),
            child: const Icon(Icons.add, size: 35),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      ),
    );
  }
}
