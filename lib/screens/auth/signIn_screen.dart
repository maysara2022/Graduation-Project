import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/firebase/fb_auth_controller.dart';
import 'package:graduationproject/models/firebase_response.dart';
import 'package:graduationproject/prefs/shared_pref_controller.dart';
import 'package:graduationproject/utils/context-extenssion.dart';
import '../../widgets/login textfiled.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _obscur = true;
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;

  String? _EmailError;

  String? _passwordError;

  @override
  void initState() {
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
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
                        controll: _emailTextController,
                        keyboardType: TextInputType.emailAddress,
                        title: 'البريد الالكتروني',
                        hint: 'أدخل البريد الالكتروني',
                        prefIcon: Icon(Icons.person_outline),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFiledX(
                        controll: _passwordTextController,
                        keyboardType: TextInputType.text,
                        title: 'كلمة المرور',
                        hint: 'أدخل كلمة المرور',
                        obscureText: _obscur,
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() => _obscur = !_obscur);
                            },
                            icon: Icon(_obscur
                                ? Icons.visibility
                                : Icons.visibility_off)),
                        prefIcon: Icon(Icons.phone_android),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: 48,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            _login();
                          },
                          child: Text(
                            "تسجيل الدخول ",
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
                        height: 25,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "ليس لديك حساب ؟  ",
                            style: GoogleFonts.cairo(
                                fontSize: 17, color: Colors.black),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/log_up');
                              },
                              child: Text(
                                "حساب جديد",
                                style:
                                    GoogleFonts.cairo(color: Color(0xFFb70e0e)),
                              )),

                        ],
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

  void _performLogin() {
    SystemChannels.textInput.invokeListMethod('TextInput.hide');

    if (_checkData()) {
      _login();
    }
  }

  bool _checkData() {
    _ErrorValue();
    if (_emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      return true;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('هناك خطأ , أدخل البيانات المطلوبة بشكل صحيح'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
        dismissDirection: DismissDirection.horizontal,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        onVisible: () => print('Visble'),
      ),
    );
    return false;
  }

  // ignore: non_constant_identifier_names
  void _ErrorValue() {
    setState(() {
      _EmailError =
          _emailTextController.text.isEmpty ? 'أخل البريد الإلكتروني' : null;
      _passwordError =
          _passwordTextController.text.isEmpty ? 'أدخل كلمة المرور ' : null;
    });
  }

  void _login() async {
    FirebaseResponse response = await FbAuthController()
        .sigIn(_emailTextController.text, _passwordTextController.text);
    if (response.success)
      Navigator.pushReplacementNamed(context, '/bottom_screen');
    context.shwoMassege(message: response.message, error: !response.success);
    SharedPrefController().save(email: _emailTextController.text);
  }
}
