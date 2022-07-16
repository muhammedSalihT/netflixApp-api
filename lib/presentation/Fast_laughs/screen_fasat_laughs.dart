import 'package:flutter/material.dart';
import 'package:netflixapp/presentation/Fast_laughs/widgets/fast_laughs.dart';
import 'package:netflixapp/service/movie_service.dart';

class ScreenFastAndLaughs extends StatelessWidget {
  const ScreenFastAndLaughs({Key? key, }) : super(key: key);

  // final int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: SafeArea(
      //     child: FutureBuilder(
      //         future: MovieService.getVedios(key: "h6hZkvrFIj0"),
      //         builder: (context, AsyncSnapshot<dynamic> snapshot) {
      //           return PageView(
      //               scrollDirection: Axis.vertical,
      //               children: List.generate(10, (index) {
      //                 return VedioListItem(
      //                   index: index,
      //                 );
      //               }));
      //         })),
    );
  }
}
