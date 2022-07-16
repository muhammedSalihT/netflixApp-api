import 'package:flutter/material.dart';
import 'package:netflixapp/presentation/Fast_laughs/screen_fasat_laughs.dart';
import 'package:netflixapp/presentation/Home/screens_home.dart';
import 'package:netflixapp/presentation/downloads/Screen_downloads.dart';
import 'package:netflixapp/presentation/mainpage/bottom_nav.dart';
import 'package:netflixapp/presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:netflixapp/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({Key? key}) : super(key: key);

  final _page =  [
    const ScreenHome(),
    const ScreenNewAndHot(),
    const ScreenFastAndLaughs(),
    const ScreenSearch(),
    ScreenDownloads()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: ValueListenableBuilder(
              valueListenable: selectedIndexNotifier,
              builder: (BuildContext context, int newIndex, child) {
                return _page[newIndex];
              }),
        ),
            bottomNavigationBar: BottomNavgiationWidget(),
            );
  }
}
