import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uas_43a87006190301/controller/favorite_ctr.dart';
import 'package:uas_43a87006190301/screens/detail_scr.dart';
import 'package:uas_43a87006190301/tema/colors.dart';
import 'package:uas_43a87006190301/widget/app_bar.dart';

class Favorites extends StatelessWidget {
  Widget ShowContainer() {
    return Builder(
      builder: (context) {
        var favProv = Provider.of<FavoritesProv>(context);
        return Expanded(
          child: ListView.separated(
            itemCount: favProv.getFavListLength,
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(favProv.getFavList[index].Id!),
                onDismissed: (direction) {
                  favProv.removeFav(favProv.getFavList[index]);
                  Get.snackbar('Removed from Favourites', '');
                },
                direction: DismissDirection.startToEnd,
                background: Container(
                  color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 35,
                          ),
                          Icon(
                            Icons.clear,
                            color: Colors.white,
                            size: 38,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Remove\nfrom Fav',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.jockeyOne(
                                fontSize: 23,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                child: GestureDetector(
                  onTap: () async {
                    await Get.to(() => Details(),
                        arguments: favProv.getFavList[index],
                        duration: Duration(milliseconds: 700),
                        transition: Transition.leftToRightWithFade);
                  },
                  child: Container(
                    color: kGreyColor,
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 185,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Image(
                                    image: NetworkImage(
                                        favProv.getFavList[index].Image!),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        favProv.getFavList[index].Title!,
                                        style: GoogleFonts.jockeyOne(
                                            fontSize: 20, color: kAccentColor),
                                      ),
                                      Text(
                                        favProv.getFavList[index].Year!,
                                        style: GoogleFonts.jockeyOne(
                                            fontSize: 18, color: kAccentColor),
                                      ),
                                      Text(
                                        favProv.getFavList[index].Crew!,
                                        style: GoogleFonts.jockeyOne(
                                            fontSize: 15, color: kAccentColor),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: kImdbColor,
                                            size: 23,
                                          ),
                                          favProv.getFavList[index].IMDbRating!
                                                  .isNotEmpty
                                              ? Text(
                                                  ' ' +
                                                      favProv.getFavList[index]
                                                          .IMDbRating!,
                                                  style: GoogleFonts.jockeyOne(
                                                      fontSize: 18,
                                                      color: kAccentColor),
                                                )
                                              : Text(
                                                  ' TBA',
                                                  style: GoogleFonts.jockeyOne(
                                                    color: kAccentColor,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.white54,
                indent: 8,
                endIndent: 8,
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreyColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(54),
        child: NamedAppBar("Favourites"),
      ),
      body: Column(
        children: [
          ShowContainer(),
        ],
      ),
    );
  }
}
