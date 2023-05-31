import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/bottomBar/bn_screen.dart';
import 'package:graduationproject/screens/app/Complant%20Screen%20_view.dart';
import 'package:graduationproject/screens/app/home_screen.dart';
import 'package:graduationproject/screens/app/map_screen.dart';
import 'package:graduationproject/screens/app/more_screen.dart';

class BottomBar extends StatefulWidget {
  final String assetName = 'ima/image_that_does_not_exist.svg';

  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentindex = 0;
  List<BnScreen> _bnscreen = <BnScreen>[
    BnScreen(title: 'Home', widget: HomeScreen()),
    BnScreen(title: 'Map', widget: MapScreen()),
    BnScreen(title: 'AddProdlem', widget: ComplaintPage()),
    BnScreen(title: 'Setting', widget: MoreScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            onTap: (int selectedItemIndex) {
              setState(() {
                _currentindex = selectedItemIndex;
              });
            },
            currentIndex: _currentindex,
            selectedLabelStyle: GoogleFonts.cairo(),
            unselectedLabelStyle: GoogleFonts.cairo(),
            selectedItemColor: Color(0xFFb70e0e),
            unselectedItemColor: Color(0xff384042),
            iconSize: 25,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('images/home.png')),
                  label: 'الرئيسية'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('images/pin.png')),
                  label: 'الخريطة'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('images/megaphone (2).png')),
                  label: 'الشكاوي'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.more_horiz), label: 'المزيد'),
            ]),
        body: _bnscreen[_currentindex].widget,
      ),
    );
  }
}
