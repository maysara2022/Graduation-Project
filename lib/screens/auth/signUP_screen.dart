import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/prefs/shared_pref_controller.dart';
import 'package:graduationproject/screens/auth/signIn_screen.dart';
import 'package:graduationproject/utils/context-extenssion.dart';

import '../../widgets/login textfiled.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  String verificationFailMassage = '';
  String? idCode;
  bool isButtonDisabled = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0XFFf2f2f2),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'تسجيل الدخول',
            style: GoogleFonts.cairo(
                fontSize: 25.sp,
                color: Colors.black,
                fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 60.h,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.r),
                  border: Border.all(color: Colors.black12, width: .5.w),
                  color: Colors.white38,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10).w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'اهلا وسهلا بك',
                        style: GoogleFonts.cairo(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        'الدخول الى حسابك.',
                        style: GoogleFonts.cairo(
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      TextFiledX(
                        maxLength: 10,
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Image.asset('images/alam.png')),
                        controll: _phoneNumberController,
                        keyboardType: TextInputType.number,
                        title: 'رقم الجوال ',
                        hint: 'أدخل رقم الجوال الخاص بك ',
                        prefIcon: const Icon(Icons.phone_android),
                      ),
                      Text(
                        verificationFailMassage,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        height: 48.h,
                        width: double.infinity.w,
                        child: ElevatedButton(
                          onPressed: isButtonDisabled
                              ? null
                              : () async {
                                  setState(() {
                                    isButtonDisabled =
                                        true; // تعطيل الزر أثناء تنفيذ العملية
                                  });
                                  _checkData();
                                  await FirebaseAuth.instance.verifyPhoneNumber(
                                    phoneNumber:
                                        "+970" + _phoneNumberController.text,
                                    verificationCompleted:
                                        (PhoneAuthCredential credential) {},
                                    verificationFailed:
                                        (FirebaseAuthException e) {
                                      setState(() {
                                        isButtonDisabled = false;
                                      });
                                      setState(() {
                                        verificationFailMassage = e.code;
                                        context.shwoMassege(
                                            message:
                                                'خطأ , يُرجى التحقق من رقم الجوال ',
                                            error: true);
                                      });
                                    },
                                    codeSent: (String verificationId,
                                        int? resendToken) {
                                      setState(() {
                                        isButtonDisabled = false;
                                      });
                                      Navigator.of(context).push(
                                          PageRouteBuilder(
                                              pageBuilder: (_, __, ___) =>
                                                  SignInScreen(
                                                      verificationId:
                                                          verificationId)));
                                    },
                                    timeout: const Duration(seconds: 60),
                                    codeAutoRetrievalTimeout:
                                        (String verificationId) {},
                                  );

                                },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFb70e0e),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              )),
                          child: isButtonDisabled
                              ? const CircularProgressIndicator() // عنصر الـ Process Indicator أثناء التنفيذ
                              : Text(
                                  "أرسل رمز التحقق",
                                  style: GoogleFonts.cairo(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
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
                          onPressed: () {
                            Navigator.pushNamed(context, '/bottom_screen');
                          },
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r)),
                              side: const BorderSide(color: Color(0xFFb70e0e))),
                          child: Text(
                            "الدخول كزائر",
                            style: GoogleFonts.cairo(
                                color: const Color(0xFFb70e0e),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _checkData() {
    if (_phoneNumberController.text.isNotEmpty) {
      return true;
    }
    context.shwoMassege(message: 'أدخل رقم الجوال أولا', error: true);
    return false;
  }
}
