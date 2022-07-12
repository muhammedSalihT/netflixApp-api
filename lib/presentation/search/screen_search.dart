import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflixapp/core/constants.dart';
import 'package:netflixapp/presentation/search/search_idile.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:const [
        CupertinoSearchTextField(backgroundColor: Color.fromARGB(216, 78, 76, 76),prefixIcon: Icon(
        CupertinoIcons.search,
        color: Colors.grey,
        ),
        suffixIcon: Icon(CupertinoIcons.xmark_circle_fill,color: Colors.grey,),
        style: TextStyle(color: Colors.white),
        ),
        kHeight,
         Expanded(child: SearchIdileWidget()),

      ]),
      )),
    );
  }
}