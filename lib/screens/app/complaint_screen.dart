import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/firebase/ComplaintController.dart';
import 'package:graduationproject/widgets/login%20textfiled.dart';
import 'package:image_picker/image_picker.dart';

class ComplaintScreen extends StatefulWidget {
   ComplaintScreen({Key? key}) : super(key: key);


  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

final _formKey = GlobalKey<FormState>();
final _titleController = TextEditingController();
final _descriptionController = TextEditingController();
final _adressController = TextEditingController();
final _typeController = TextEditingController();
XFile? _imageFile;





String dropdownValue = 'اختر نوع الشكوى';

class _ComplaintScreenState extends State<ComplaintScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.white,
              bottom: TabBar(
                indicatorPadding: EdgeInsets.symmetric(horizontal: 30),
                indicatorWeight: 2,
                indicatorColor: Color(0xFF820000),
                tabs: [
                  Tab(
                      child: Text(
                    'تقديم شكوى ',
                    style:
                        GoogleFonts.cairo(color: Colors.black45, fontSize: 14),
                  )),
                  Tab(
                      child: Text(
                    'الشكاوي والردود ',
                    style:
                        GoogleFonts.cairo(color: Colors.black45, fontSize: 14),
                  )),
                ],
              ),
              title: Text(
                'الشكاوي',
                style: GoogleFonts.cairo(color: Colors.black),
              ),
            ),
            body: TabBarView(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15,),
                        TextFiledX(
                          title: 'عنوان الشكوى',
                          hint: 'أدخل عنوان الشكوى',
                          keyboardType: TextInputType.text,
                          controll: _titleController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'تفاصيل الشكوى',
                          style: GoogleFonts.cairo(
                              fontSize: 15, fontWeight: FontWeight.w500),
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
                            hintStyle: GoogleFonts.cairo(
                                fontSize: 14, color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(width: .4, color: Colors.grey)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'نوع الشكوى',
                              style: GoogleFonts.cairo(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              height: 55,
                              child: DropdownButtonFormField(
                                hint: Text('اختر نوع الشكوى'),
                                style: GoogleFonts.cairo(height: 1),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                          width: .4, color: Colors.grey)),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                items: <String>[
                                  'المجاري',
                                  'اضاءة',
                                  'بنية التحتية',
                                  'الحاويات النفايات'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue = newValue!;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'المنطقة',
                          style: GoogleFonts.cairo(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          height: 55,
                          child: DropdownButtonFormField(
                            hint: Text('اختر منطقة الشكوى'),
                            style: GoogleFonts.cairo(height: 1),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                      width: .4, color: Colors.grey)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            items: <String>[
                              'المجاري',
                              'اضاءة',
                              'بنية التحتية',
                              'الحاويات النفايات'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'رفع الصور',
                          style: GoogleFonts.cairo(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        GestureDetector(
                          onTap: ()async {
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
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadiusDirectional.circular(20),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (_imageFile != null)
                                    Image.file(
                                      File(_imageFile!.path),
                                      fit: BoxFit.cover,
                                    ),
                                  Column(
                                    children: [
                                      Icon(Icons.photo_size_select_actual_outlined),
                                      Text(
                                        'صورة للمشكلة',
                                        style: GoogleFonts.cairo(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'JPG , JPEG',
                                        style: GoogleFonts.cairo(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 48,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                  await ComlaintController().addComlaint(
                                    _titleController.text,
                                    _descriptionController.text,
                                    _typeController.text,
                                    _adressController.text,
                                    _imageFile!,
                                  );
                                } else {}
                                Navigator.of(context).pop();
                            },
                            child: Text(
                              "إرسال",
                              style: GoogleFonts.cairo(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xFFb70e0e),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                Text('data')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
