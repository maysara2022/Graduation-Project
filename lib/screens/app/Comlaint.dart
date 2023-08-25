import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/firebase/ComplaintController.dart';
import 'package:graduationproject/models/firebase_response.dart';
import 'package:graduationproject/prefs/shared_pref_controller.dart';
import 'package:graduationproject/utils/context-extenssion.dart';
import 'package:graduationproject/widgets/login%20textfiled.dart';
import 'package:image_picker/image_picker.dart';

class Complaintscreen extends StatefulWidget {
  Complaintscreen({Key? key}) : super(key: key);

  @override
  State<Complaintscreen> createState() => _ComplaintScreenState();
}

final _formKey = GlobalKey<FormState>();
final _titleController = TextEditingController();
final _descriptionController = TextEditingController();
final _adressController = TextEditingController();
final _typeController = TextEditingController();
XFile? _imageFile;
String? addressselectedValue;
String userId =
SharedPrefController().getValue<String>(key: PrefKeys.userId.name)!;

String? typeselectedValue;

String dropdownValue = 'اختر نوع الشكوى';

class _ComplaintScreenState extends State<Complaintscreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: Navigator.of(context).pop,
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.white,
              title: Text(
                'إضافة شكوى',
                style: GoogleFonts.cairo(color: Colors.black),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15).w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    TextFiledX(
                      title: 'عنوان الشكوى',
                      hint: 'أدخل عنوان الشكوى',
                      keyboardType: TextInputType.text,
                      controll: _titleController,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'تفاصيل الشكوى',
                      style: GoogleFonts.cairo(
                          fontSize: 15.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextField(
                      controller: _descriptionController,
                      minLines: 3,
                      maxLines: 10,
                      decoration: InputDecoration(
                        hintText: 'أدخل نص الشكوى هنا...',
                        hintStyle:
                        GoogleFonts.cairo(fontSize: 14.sp, color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15).w,
                            borderSide:
                            BorderSide(width: .4.w, color: Colors.grey)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15).w,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'نوع الشكوى',
                          style: GoogleFonts.cairo(
                              fontSize: 15.sp, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        SizedBox(
                          height: 55.h,
                          child: DropdownButtonFormField(
                            hint: Text('اختر نوع الشكوى'),
                            style: GoogleFonts.cairo(height: 1.h),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15).r,
                                  borderSide: BorderSide(
                                      width: .4.w, color: Colors.grey)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15).r,
                              ),
                            ),
                            items: [
                              DropdownMenuItem(
                                value: 'بنية التحتية',
                                child: Text(
                                  'بنية التحتية',
                                  style: GoogleFonts.cairo(color: Colors.black),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'الاضاءة الشوارع',
                                child: Text(
                                  'الاضاءة الشوارع',
                                  style: GoogleFonts.cairo(color: Colors.black),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'غير ذلك',
                                child: Text(
                                  'غير ذلك',
                                  style: GoogleFonts.cairo(color: Colors.black),
                                ),
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                typeselectedValue = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'المنطقة',
                      style: GoogleFonts.cairo(
                          fontSize: 15.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    SizedBox(
                      height: 55.h,
                      child: DropdownButtonFormField(
                        hint: Text('اختر منطقة الشكوى'),
                        style: GoogleFonts.cairo(height: 1.h),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15).r,
                              borderSide:
                              BorderSide(width: .4.w, color: Colors.grey)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15).r,
                          ),
                        ),
                        items: [
                          DropdownMenuItem(
                              value: 'الإستقامة',
                              child: Text(
                                'الإستقامة',
                                style: GoogleFonts.cairo(color: Colors.black),
                              )),
                          DropdownMenuItem(
                              value: 'بركة الوز',
                              child: Text(
                                'بركة الوز',
                                style: GoogleFonts.cairo(color: Colors.black),
                              )),
                          DropdownMenuItem(
                              value: 'الكرامة',
                              child: Text(
                                'الكرامة',
                                style: GoogleFonts.cairo(color: Colors.black),
                              )),
                          DropdownMenuItem(
                              value: 'السبخة',
                              child: Text(
                                'السبخة',
                                style: GoogleFonts.cairo(color: Colors.black),
                              )),
                        ],
                        onChanged: (value) {
                          setState(() {
                            addressselectedValue = value!;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      'رفع الصور',
                      style: GoogleFonts.cairo(
                          fontSize: 15.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    GestureDetector(
                      onTap: () async {
                        final XFile? imageFile = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        if (imageFile != null) {
                          setState(() {
                            _imageFile = imageFile;
                          });
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: 150.h,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadiusDirectional.circular(20.r),
                        ),
                        child: Center(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                if (_imageFile != null)
                                  Image.file(
                                    File(_imageFile!.path),
                                  ),
                                Column(
                                  children: [
                                    Text(
                                      ' صورة للمشكلة',
                                      style: GoogleFonts.cairo(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('PNG , JPG',
                                        style: GoogleFonts.cairo(
                                            fontWeight: FontWeight.bold)),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      height: 48.h,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          await ComlaintController().addComlaint(
                            _titleController.text,
                            _descriptionController.text,
                            addressselectedValue!,
                            typeselectedValue!,
                            _imageFile!,
                            userId,
                          );
                          _titleController.clear();
                          _descriptionController.clear();
                          context.shwoMassege(message: 'تم إضافة الشكوى بنجاح', error: false);
                          Navigator.pushNamed(context, '/bottom_screen');
                        },
                        child: Text(
                          "إرسال",
                          style: GoogleFonts.cairo(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFFb70e0e),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
