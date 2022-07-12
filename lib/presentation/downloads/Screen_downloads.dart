import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflixapp/core/colors.dart';
import 'package:netflixapp/core/constants.dart';
import 'package:netflixapp/presentation/widget/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({Key? key}) : super(key: key);

  final List imageList = [
    "https://assets-in.bmscdn.com/discovery-catalog/events/tr:w-400,h-600,bg-CCCCCC:w-400.0,h-660.0,cm-pad_resize,bg-000000,fo-top:oi-discovery-catalog@@icons@@like_202006280402.png,ox-24,oy-617,ow-29:q-80/et00302403-qfzdgnvvrc-portrait.jpg",
    "https://assets-in.bmscdn.com/discovery-catalog/events/tr:w-400,h-600,bg-CCCCCC:w-400.0,h-660.0,cm-pad_resize,bg-000000,fo-top:oi-discovery-catalog@@icons@@like_202006280402.png,ox-24,oy-617,ow-29:q-80/et00302403-qfzdgnvvrc-portrait.jpg",
    "https://assets-in.bmscdn.com/discovery-catalog/events/tr:w-400,h-600,bg-CCCCCC:w-400.0,h-660.0,cm-pad_resize,bg-000000,fo-top:oi-discovery-catalog@@icons@@like_202006280402.png,ox-24,oy-617,ow-29:q-80/et00302403-qfzdgnvvrc-portrait.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: "Downloads",
          )),
      body: ListView(
        children: [
          const _SmartDownloads(),
          kWidth,
          const Text(
            'Introducing Downloads For You',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: kColorWhite, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          kHeight,
          const Text(
            "We will download a persoanalized selelection of\n movies and shows for you,so there's\n always somthing to watch on your\n device. ",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          Container(
            width: size.width,
            height: size.width,
            color: Colors.white,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: size.width * 0.35,
                  backgroundColor: Colors.grey,
                ),
                DownloadsImage(
                  width: .3,
                  imageList: imageList[0],
                  margin: EdgeInsets.only(left: 150,bottom: 30),
                  angle: 15,
                  height: .4,
                ),
                DownloadsImage(
                  width: .3,
                  imageList: imageList[0],
                  margin: EdgeInsets.only(right: 150,bottom: 30),
                  angle: -15,
                  height: .4,
                ), DownloadsImage(
                  width: .5,
                  imageList: imageList[0],
                  margin: EdgeInsets.zero,
                  angle: 0,
                  height: .3,
                )
              ],
            ),
          ),
          MaterialButton(
            color: kColorBlue,
            onPressed: () {},
            child: const Text(
              'Set up',
              style: TextStyle(
                  color: kColorWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          MaterialButton(
            color: kColorWhite,
            onPressed: () {},
            child: const Text(
              'See what you can download',
              style: TextStyle(
                  color: kColorBlack,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

class DownloadsImage extends StatelessWidget {
  const DownloadsImage({
    Key? key,
    required this.imageList,
    required this.angle,
    required this.width,
    required this.height,  required this.margin,
  }) : super(key: key);

  final double width;
  final double height;
  final String imageList;
  final double angle;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width * width,
        height: size.height * height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image: NetworkImage(imageList))),
      ),
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        kWidth,
        Icon(Icons.settings, color: kColorWhite),
        kWidth,
        Text("Smart Downloads")
      ],
    );
  }
}
