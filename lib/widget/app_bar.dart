import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_43a87006190301/screens/favorites_scr.dart';
import 'package:uas_43a87006190301/tema/colors.dart';

AppBar myAppbar = AppBar(
  title: Text('Movies App'),
  centerTitle: true,
  flexibleSpace: Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color.fromARGB(255, 188, 200, 58),
          Color.fromARGB(255, 30, 233, 57)
        ],
      ),
    ),
  ),
  actions: [
    IconButton(
      icon: Icon(
        Icons.favorite,
        color: kImdbColor,
      ),
      onPressed: () async {
        await Get.to(
          () => Favorites(),
          duration: Duration(milliseconds: 1100),
          transition: Transition.rightToLeftWithFade,
        );
      },
    )
  ],
);

Widget NamedAppBar(String _title) {
  return AppBar(
    title: Text(_title),
    backgroundColor: kLightBlueColor,
    centerTitle: true,
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.pink, Colors.deepPurple],
        ),
      ),
    ),
  );
}
