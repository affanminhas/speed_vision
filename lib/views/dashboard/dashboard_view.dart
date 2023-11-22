import 'package:flutter/material.dart';
import 'package:speed_vision/constant/color_palete.dart';
import 'package:speed_vision/views/explore/explore_view.dart';
import 'package:speed_vision/views/home/home_view.dart';
import 'package:speed_vision/views/profile/profile_view.dart';

class DashboardView extends StatefulWidget {
  static const String id = '/dashboard-view';

  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int currentIndex = 0;
  var screens = [
    const HomeView(),
    const ExploreView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            screens[currentIndex],
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.18),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: const Offset(2, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => setState(() {
                        currentIndex = 0;
                      }),
                      child: Icon(
                        Icons.home,
                        size: 30,
                        color: currentIndex == 0 ? ColorPalette.primaryColor : ColorPalette.greyShade400,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => setState(() {
                        currentIndex = 1;
                      }),
                      child: Icon(
                        Icons.search,
                        size: 40,
                        color: currentIndex == 1 ? ColorPalette.primaryColor : ColorPalette.greyShade400,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => setState(() {
                        currentIndex = 2;
                      }),
                      child: Icon(
                        Icons.person,
                        size: 30,
                        color: currentIndex == 2 ? ColorPalette.primaryColor : ColorPalette.greyShade400,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
