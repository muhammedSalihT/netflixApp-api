import 'package:flutter/material.dart';
import 'package:netflixapp/core/constants.dart';
import 'package:netflixapp/presentation/widget/app_bar_widget.dart';
import 'package:netflixapp/presentation/widget/main_card.dart';
import 'package:netflixapp/presentation/widget/main_title.dart';
import 'package:netflixapp/presentation/widget/number_card.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: 'NetfLix',
          )),
      body: ListView(children:const [
        kHeight,
        MainTitle(title: 'Now Playing'),
        kHeight,
        MainCard(language: "",url:  '/movie/now_playing',
        ),
        kHeight,
        MainTitle(
          title: "Trending Now",
        ),
        kHeight,
        MainCard(language: "",url: '/movie/top_rated',
        ),
        kHeight,
         MainTitle(title: 'Tense drama'),
         kHeight,
        MainCard(language: "",url: '/movie/upcoming',
        ),
        kHeight,
        MainTitle(title: 'Top 20 indian movies'),
        kHeight,
        NumberCard(language:'&with_origin_country=IN' ,url:'/movie/top_rated' ),
        kHeight,
        MainTitle(
          title: "South indian cinema",
        ),
        kHeight,
        MainCard(language:"&with_origin_country=IN",url: '/movie/now_playing',
        ),
      ]),
    );
  }
  }

