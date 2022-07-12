import 'package:flutter/material.dart';

ValueNotifier<int>selectedIndexNotifier = ValueNotifier(0);

class BottomNavgiationWidget extends StatelessWidget {
  const BottomNavgiationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedIndexNotifier,
      builder: (BuildContext context, int newIndex, child){
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
              currentIndex: newIndex,
              onTap: (newIndex) {
                selectedIndexNotifier.value = newIndex;
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.new_label), label: "New&Hot"),
                     BottomNavigationBarItem(
                    icon: Icon(Icons.tiktok), label: "Fastlaughs"),
                     BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: "Search"),
                     BottomNavigationBarItem(
                    icon: Icon(Icons.download_rounded), label: "Downloads")
              ]);
      }
    );
  }
}