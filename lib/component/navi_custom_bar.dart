import 'package:flutter/material.dart';
import 'package:seasonal_korea_app/component/navi_custom_button.dart';
import 'package:seasonal_korea_app/model/main_model.dart';
import 'package:seasonal_korea_app/page/favorite_screen.dart';
import 'package:seasonal_korea_app/util/constants.dart';

class NaviCustomBar extends StatelessWidget {
  NaviCustomBar({
    //Key? key,
    required this.model,
  });

  MainModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 3,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NaviCustomButton(Icons.home, Icons.home_outlined,
                  model.isSelectedNavi(NaviItem.home), () {
                model.setSelectedNavi(NaviItem.home);
              }),
              NaviCustomButton(Icons.favorite, Icons.favorite_outline,
                  model.isSelectedNavi(NaviItem.favorite), () {
                model.setSelectedNavi(NaviItem.favorite);
              }),
              NaviCustomButton(Icons.person, Icons.person_outline,
                  model.isSelectedNavi(NaviItem.profile), () {
                model.setSelectedNavi(NaviItem.profile);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
