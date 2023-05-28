import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/firebase/fb_auth_controller.dart';
import 'package:graduationproject/firebase/fb_firstore_controller.dart';
import 'package:graduationproject/models/firebase_response.dart';
import 'package:graduationproject/prefs/shared_pref_controller.dart';
import 'package:graduationproject/screens/app/fatora_screen.dart';
import 'package:graduationproject/utils/context-extenssion.dart';

import '../../widgets/login textfiled.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscur = true;
  late TextEditingController _nameEditingController;
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;
  late TextEditingController _phoneTextController;
  late TextEditingController _idNumberTextController;
  late TextEditingController _subIdTextController;
  late String sub = _subIdTextController as String;

  String? _EmailError;
  String? _nameError;
  String? _passwordError;

  @override
  void initState() {
    _nameEditingController = TextEditingController();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _phoneTextController = TextEditingController();
    _idNumberTextController = TextEditingController();
    _subIdTextController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _nameEditingController.dispose();
    _passwordTextController.dispose();
    _phoneTextController.dispose();
    _idNumberTextController.dispose();
    super.dispose();
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
            'انشاء حساب جديد',
            style: GoogleFonts.cairo(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
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
                        'انشاء حساب جديد',
                        style: GoogleFonts.cairo(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'تسجيل الدخول الى حسابك.',
                        style: GoogleFonts.cairo(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      TextFiledX(
                        controll: _nameEditingController,
                        keyboardType: TextInputType.name,
                        title: 'الاسم كاملا',
                        hint: 'أدخل الاسم كاملا',
                        prefIcon: Icon(Icons.person_outline),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFiledX(
                        controll: _phoneTextController,
                        keyboardType: TextInputType.phone,
                        title: 'رقم الجوال',
                        hint: 'أدخل رقم الجوال',
                        prefIcon: Icon(Icons.phone_android),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFiledX(
                        controll: _idNumberTextController,
                        keyboardType: TextInputType.number,
                        title: 'رقم الهوية الخاصة بالاشتراك',
                        hint: 'أدخل رقم الهوية الخاصة بالاشتراك',
                        prefIcon: Icon(Icons.card_membership),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFiledX(
                        controll: _emailTextController,
                        keyboardType: TextInputType.emailAddress,
                        title: 'البريد الالكتروني',
                        hint: 'أدخل البريد الالكتروني',
                        prefIcon: Icon(Icons.email_outlined),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFiledX(
                        keyboardType: TextInputType.number,
                        title: 'رقم اشتراك المياه',
                        hint: 'أدخل رقم اشتراك المياه',
                        prefIcon: Icon(Icons.credit_card),
                        controll: _subIdTextController,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFiledX(
                        controll: _passwordTextController,
                        keyboardType: TextInputType.visiblePassword,
                        title: 'كلمة المرور',
                        hint: 'أدخل كلمة المرور',
                        prefIcon: Icon(Icons.lock_outline),
                        obscureText: _obscur,
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() => _obscur = !_obscur);
                            },
                            icon: Icon(_obscur
                                ? Icons.visibility
                                : Icons.visibility_off)),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        height: 48,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            _register();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFb70e0e),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          child: Text(
                            "إنشاء حساب ",
                            style: GoogleFonts.cairo(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "لديك حساب بالفعل ؟  ",
                            style: GoogleFonts.cairo(
                                fontSize: 17, color: Colors.black),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/sign_in');
                                Get.to(FatoraScreen(), arguments: [sub]);
                              },
                              child: Text(
                                "تسجيل الدخول",
                                style:
                                    GoogleFonts.cairo(color: Color(0xFFb70e0e)),
                              )),
                        ],
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

  Future<void> _performRegister() async {
    SystemChannels.textInput.invokeListMethod('TextInput.hide');

    if (_checkData()) {
      await _register();
    }
  }

  bool _checkData() {
    if (_emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      return true;
    }
    context.shwoMassege(message: 'أدخل البيانات المطلوبة', error: true);
    return false;
  }

  Future<void> _register() async {
    FirebaseResponse response = await FbAuthController().createAccount(
        _emailTextController.text,
        _passwordTextController.text,
        _nameEditingController.text);
    FbFirstoreController().createUserInFirestore(
        _nameEditingController.text,
        _phoneTextController.text,
        _idNumberTextController.text,
        _emailTextController.text,
        _subIdTextController.text,
        response.id);
    if (response.success)
      Navigator.pushReplacementNamed(context, '/home_screen');
    context.shwoMassege(message: response.message, error: !response.success);
    SharedPrefController()
        .save(email: _emailTextController.text, sub: _subIdTextController.text,userId: response.id);
  }
}
