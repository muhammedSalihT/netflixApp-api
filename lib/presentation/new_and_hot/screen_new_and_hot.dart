import 'package:flutter/material.dart';
import 'package:netflixapp/core/constants.dart';
import 'package:netflixapp/presentation/widget/app_bar_widget.dart';
import 'package:netflixapp/presentation/widget/text_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return  Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: "New&Hot",
          )),
          body: ListView(
            children: 
              [Column(
                children: [
                  Container(color: Colors.white,
                    width: double.infinity,
                    height:screenSize.height*.4 ,
                  ),
                    const TextWidget(title: 'Tall Girl 2',size: 50,textColor: Colors.white,weight: FontWeight.w900,),
                     const TextWidget(title: 'Coming on friday',size: 30,textColor: Colors.white,weight: FontWeight.w300,),
                     kHeight,
                      Row(
                        children: const[
                          TextWidget(title: 'Tall Girl 2',size: 25,textColor: Colors.white,weight: FontWeight.w500,),
                        ],
                      ),
                      kHeight,
                     const TextWidget(title: 'The movie Tall girl is true story based on a 10 year old girl who intelligent and gorgius, she has a dog named popy,in this cinema talk about the bonding beteween them.',size: 20,textColor: Colors.grey,weight: FontWeight.w800,)
                ],
          
              ),
            ],
          ),
    );
  }
}

