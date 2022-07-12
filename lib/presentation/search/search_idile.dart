import 'package:flutter/cupertino.dart';
import 'package:netflixapp/core/constants.dart';

const imageUrl =
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrHOsk8DLfA29H4UzuaoLxGawWrjQpwB1upw&usqp=CAU";

class SearchIdileWidget extends StatelessWidget {
  const SearchIdileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Top Searches',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        kWidth,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => const TopSearchTile(),
              separatorBuilder: (context, index) => kHeight,
              itemCount: 10),
        )
      ],
    );
  }
}

class TopSearchTile extends StatelessWidget {
  const TopSearchTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(imageUrl);
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.3,
      height: 100,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(imageUrl), fit: BoxFit.cover)),
    );
  }
}
