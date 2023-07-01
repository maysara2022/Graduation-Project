import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/firebase/fb_auth_controller.dart';
import 'package:graduationproject/screens/auth/signIn_screen.dart';
import 'package:graduationproject/utils/context-extenssion.dart';

import '../../widgets/login textfiled.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneNumberController=TextEditingController();
  String verificationFailMassage='';
  String? idCode;
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
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: Colors.black12, width: .5),
                  color: Colors.white38,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'اهلا وسهلا بك',
                        style: GoogleFonts.cairo(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15,),
                      Text(
                        'الدخول الى حسابك.',
                        style: GoogleFonts.cairo(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFiledX(
                        controll: _phoneNumberController,
                        keyboardType: TextInputType.text,
                        title: 'رقم الجوال ',
                        hint: 'أدخل رقم الجوال الخاص بك ',
                        prefIcon: Icon(Icons.phone_android),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        height: 48,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async{

                            await FirebaseAuth.instance.verifyPhoneNumber(
                              phoneNumber: '+970599024023',
                              verificationCompleted: (PhoneAuthCredential credential) {},
                              verificationFailed: (FirebaseAuthException e) {
                                setState(() {
                                  verificationFailMassage = e.code;
                                });
                              },
                              codeSent: (String verificationId, int? resendToken) {
                                Navigator.of(context).push(PageRouteBuilder(pageBuilder: (_,__,___)=>SignInScreen(verificationId:verificationId)));
                              },
                              codeAutoRetrievalTimeout: (String verificationId) {},
                            );

                          },
                          child: Text(
                            "أرسل رمز التحقق",
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
                      Text(
                        verificationFailMassage,
                      ),
                      SizedBox(
                        height: 48,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/bottom_screen');
                          },
                          child: Text(
                            "الدخول كزائر",
                            style: GoogleFonts.cairo(
                                color: Color(0xFFb70e0e),
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              side: BorderSide(color: Color(0xFFb70e0e))),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        height: 20,
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
