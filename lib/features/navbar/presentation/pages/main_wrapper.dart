import 'package:flutter/material.dart';
import 'package:travel_app_flutter/features/home/presentation/page/home_page.dart';
import 'package:travel_app_flutter/features/navbar/presentation/widgets/bar.dart';
import 'package:travel_app_flutter/features/navbar/presentation/widgets/mail.dart';
import 'package:travel_app_flutter/features/navbar/presentation/widgets/profile.dart';
import 'package:travel_app_flutter/features/profile/presentation/page/profile.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  late final PageController pageController;
  int currentIndex = 0;
  List<Widget> pages = const [
    HomePage(),
    Bar(),
    Mail(),
    ProfilePage(),
  ];

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 400), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: pages,
      ),
      bottomNavigationBar: WaterDropNavBar(
        bottomPadding: 10.0,
        waterDropColor: const Color(0xff1A434E),
        backgroundColor: Colors.white,
        onItemSelected: onTap,
        selectedIndex: currentIndex,
        barItems: [
          BarItem(
            filledIcon: Icons.home_filled,
            outlinedIcon: Icons.home_outlined,
          ),
          BarItem(
              filledIcon: Icons.favorite_rounded,
              outlinedIcon: Icons.favorite_border_rounded),
          BarItem(
              filledIcon: Icons.mail,
              outlinedIcon: Icons.mail_outline_outlined),
          BarItem(filledIcon: Icons.people, outlinedIcon: Icons.people_outline),
        ],
      ),
    ));
  }
}


//  BottomNavigationBar(
//           unselectedFontSize: 0,
//           selectedFontSize: 0,
//           type: BottomNavigationBarType.fixed,
//           currentIndex: currentIndex,
//           showSelectedLabels: false,
//           showUnselectedLabels: false,
//           backgroundColor: Colors.white,
//           onTap: onTap,
//           elevation: 0,
//           unselectedItemColor: Colors.grey,
//           selectedItemColor:  Color(0xff1A434E),
//           items: const [
//             BottomNavigationBarItem(
//               label: "Home",
//               icon: Icon(
//                 Icons.apps_rounded,
//               ),
//             ),
//             BottomNavigationBarItem(
//               label: "Bar",
//               icon: Icon(
//                 Icons.bar_chart_sharp,
//               ),
//             ),
//             BottomNavigationBarItem(
//               label: "Search",
//               icon: Icon(
//                 Icons.search,
//               ),
//             ),
//             BottomNavigationBarItem(
//               label: "My Profile",
//               icon: Icon(
//                 Icons.person,
//               ),
//             ),
//           ],
//         ),