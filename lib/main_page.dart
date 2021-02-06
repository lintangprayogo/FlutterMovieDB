import 'package:flutter/material.dart';
import 'package:movie_db_app/movie_page.dart';
import 'package:movie_db_app/series_page.dart';

import 'package:supercharged/supercharged.dart';

import 'custom_nav_bar_bottom.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.red,
          ),
          SafeArea(
              child: Container(
            color: "FAFAFC".toColor(),
          )),
          SafeArea(
            child: PageView(
              physics:new NeverScrollableScrollPhysics(),
              controller: pageController,
              onPageChanged: (idx) {
                setState(() {
                  selectedPage = idx;
                });
              },
              children: [MoviePage(), SeriesPage()],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomBottomNavBar(
              selectedIndex: selectedPage,
              onSelected: (idx) {
                setState(() {
                  selectedPage = idx;
                });
                pageController.jumpToPage(selectedPage);
              },
            ),
          )
        ],
      ),
    );
  }
}
