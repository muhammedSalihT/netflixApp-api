import 'package:flutter/material.dart';
import 'package:netflixapp/core/constants.dart';

class VedioListItem extends StatelessWidget {
  final int index;
  const VedioListItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:250.0),
                  child: IconButton(
                      onPressed: () {},
                      icon:const Icon(
                        Icons.volume_mute,
                        size: 35,
                      )),
                ),
                Column(
                  children: const [
                    CircleAvatar(),
                    SizedBox(height: 25,),
                   VedioAction(icon: Icons.emoji_emotions,title: 'LOL',),
                    VedioAction(icon: Icons.add,title: 'My List',),
                     VedioAction(icon: Icons.share,title: 'Share',),
                      VedioAction(icon: Icons.play_arrow,title: 'play',),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VedioAction extends StatelessWidget {
  final IconData icon;
  final String title;
  const VedioAction({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        Text(title),
      const SizedBox(height: 25,),
      ],
    );
  }
}
