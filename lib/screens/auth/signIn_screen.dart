import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/bottomBar/bottom_bar_screen.dart';
import 'package:graduationproject/prefs/shared_pref_controller.dart';
import 'package:graduationproject/utils/context-extenssion.dart';
import '../../widgets/login textfiled.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key, required this.verificationId});

  // SignInScreen({Key? key,required this.verificationId}) : super(key: key);
  final String verificationId;

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _codeNumberController = TextEditingController();
  bool isButtonDisabled = false;
  String? idCode;
  String verificationFailMassage = '';

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
                        'قم بإدخال رمز التحقق في الرسالة النصية ',
                        style: GoogleFonts.cairo(
                            fontSize: 16.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      const Center(
                          child: Image(
                        image: AssetImage('images/conversation.png'),
                        height: 70,
                        width: 60,
                      )),
                      SizedBox(
                        height: 30.h,
                      ),
                      TextFiledX(
                        maxLength: 6,
                        controll: _codeNumberController,
                        keyboardType: TextInputType.number,
                        title: 'رمز التحقق',
                        hint: 'أدخل رمز التحقق ',
                        prefIcon: const Icon(Icons.screen_lock_portrait),
                      ),
                      Text(verificationFailMassage),
                      SizedBox(
                        height: 25.h,
                      ),
                      SizedBox(
                        height: 48.h,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            _checkData();
                            setState(() {
                              isButtonDisabled = true;
                            });
                            try {
                              PhoneAuthCredential credential =
                                  PhoneAuthProvider.credential(
                                      verificationId: widget.verificationId,
                                      smsCode: _codeNumberController.text);
                              await _auth.signInWithCredential(credential);
                              if (_auth.currentUser != null) {
                                // ignore: use_build_context_synchronously
                                Navigator.of(context).push(PageRouteBuilder(
                                    pageBuilder: (_, __, ___) =>
                                        const BottomBar()));
                                SharedPrefController().save(email: _codeNumberController.text);

                              }
                            } on FirebaseAuthException catch (e) {
                              setState(() {
                                verificationFailMassage = e.code;
                                context.shwoMassege(
                                    message:
                                        'خطأ , يُرجى التحقق الرمز في الرسالة ',
                                    error: true);
                              });
                            }

                            setState(() {
                              isButtonDisabled = false;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFb70e0e),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              )),
                          child: Text(
                            "تأكيد",
                            style: GoogleFonts.cairo(
                                fontSize: 20.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 48.h,
                        width: double.infinity.w,
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
    if (_codeNumberController.text.isNotEmpty) {
      return true;
    }
    context.shwoMassege(
        message: 'أدخل الكود في الرسالة النصية أولا', error: true);
    return false;
  }
}
