import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/bottomBar/bottom_bar_screen.dart';
import 'package:graduationproject/utils/context-extenssion.dart';
import '../../widgets/login textfiled.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({required this.verificationId});
  // SignInScreen({Key? key,required this.verificationId}) : super(key: key);
  final String verificationId;
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _codeNumberController = TextEditingController();
  String? idCode;
  @override
  void initState() {
    phoneAuth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0XFFf2f2f2),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'تسجيل الدخول',
            style: GoogleFonts.cairo(
                fontSize: 25.sp, color: Colors.black, fontWeight: FontWeight.w600),
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
                        'قم بإدخال رمز التحقق ',
                        style: GoogleFonts.cairo(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),

                      SizedBox(
                        height: 30.h,
                      ),
                      TextFiledX(
                        controll: _codeNumberController,
                        keyboardType: TextInputType.text,
                        title: 'رمز التحقق',
                        hint: 'أدخل رمز التحقق ',
                        prefIcon: Icon(Icons.phone_android),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      SizedBox(
                        height: 48.h,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: ()async {
                            _checkData();
                            PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: widget.verificationId, smsCode: _codeNumberController.text);
                            await _auth.signInWithCredential(credential);
                            if(_auth.currentUser != null){
                              Navigator.of(context).push(PageRouteBuilder(pageBuilder: (_,__,___)=>BottomBar()));

                            }
                          },
                          child: Text(
                            "تأكيد",
                            style: GoogleFonts.cairo(
                                fontSize: 20.sp, fontWeight: FontWeight.w600),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xFFb70e0e),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              )),
                        ),
                      ),

                      SizedBox(
                        height: 48.h,
                        width: double.infinity.w,

                      ) ],
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
    context.shwoMassege(message: 'أدخل رقم الجوال أولا', error: true);
    return false;
  }
  Future<void> phoneAuth() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+970598037126',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) async {

      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
  sentCode(String authCode) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: idCode!, smsCode: authCode);
      await _auth.signInWithCredential(credential);
    } catch (ex) {
      print("exption ccccccazaa");
    }
  }
}