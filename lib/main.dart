import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:uas_43a87006190301/screens/favorites_scr.dart';
import 'package:uas_43a87006190301/screens/home_scr.dart';
import 'package:uas_43a87006190301/screens/profile_scr.dart';
import 'package:uas_43a87006190301/tema/tema.dart';
import 'package:uas_43a87006190301/widget/app_bar.dart';

void main(List<String> args) {
  runApp(App());
}

class App extends StatelessWidget {
  final List<Widget> screens = [const HomePage(), Favorites(), ProfileScreen()];
  var screenIndex = 0.obs;

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Material App",
      home: Obx(() => Scaffold(
            body: Center(
              child: screens[screenIndex.value],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: screenIndex.value,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: "Favorite"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Profile")
              ],
              onTap: (value) {
                screenIndex.value = value;
              },
            ),
          )),
    );
  }
}
