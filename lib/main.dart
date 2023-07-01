import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:graduationproject/bottomBar/bottom_bar_screen.dart';
import 'package:graduationproject/firebase_options.dart';
import 'package:graduationproject/prefs/shared_pref_controller.dart';
import 'package:graduationproject/screens/app/Comlaint.dart';
import 'package:graduationproject/screens/app/Complant%20Screen%20_view.dart';
import 'package:graduationproject/screens/app/emergency_screen.dart';
import 'package:graduationproject/screens/app/fatora_screen.dart';
import 'package:graduationproject/screens/app/home_screen.dart';
import 'package:graduationproject/screens/app/last_ads_screen.dart';
import 'package:graduationproject/screens/app/last_news_screen.dart';
import 'package:graduationproject/screens/app/lunch_screen.dart';
import 'package:graduationproject/screens/app/moreOfMore.dart';
import 'package:graduationproject/screens/auth/signIn_screen.dart';
import 'package:graduationproject/screens/auth/signUP_screen.dart';
import 'package:graduationproject/screens/massages/About%20Maghazi.dart';
import 'package:graduationproject/screens/massages/Word_Screen.dart';
import 'package:graduationproject/screens/massages/message_baldai.dart';
import 'package:graduationproject/tabBar/tabBar_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPref();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ar'), Locale('en')],
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      initialRoute: '/lunch_screen',
      routes: {
        '/lunch_screen': (context) => const lunch_screen(),
        '/log_up': (context) =>LoginScreen(),
        '/sign_in': (context) => SignInScreen(),
        '/home_screen': (context) => HomeScreen(),
        '/fatora_screen': (context) => FatoraScreen(),
        '/lastNews_screen': (context) => const LastNews(),
        '/lastAds': (context) => const LastAds(),
        '/emergency_screen': (context) => const EmergencyScreen(),
        '/bottom_screen': (context) => const BottomBar(),
        '/myTapBar': (context) => const MyTabBar(),
        '/moreOfMore': (context) => const MoreOFMore(),
        '/possMassage': (context) => const WordScreen(),
        '/about': (context) => const AboutMaghazi(),
        '/bladyeMassage': (context) => const message_Baldia(),
        '/ComplaintPage': (context) => ComplaintPage(),
        '/Complaintscreen': (context) => Complaintscreen(),
      },
    );
  }
}
