import 'package:flutter/material.dart';
import 'package:netflixapp/presentation/Fast_laughs/widgets/fast_laughs.dart';

class ScreenFastAndLaughs extends StatelessWidget {
  const ScreenFastAndLaughs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: PageView(
            scrollDirection: Axis.vertical,
        children: 
          List.generate(10, (index) {
            return VedioListItem(index: index,);
          })
      )),
    );
  }
}
