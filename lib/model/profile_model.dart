import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:seasonal_korea_app/page/tmp_screen.dart';

class ProfileModel extends Model {
  String userName = 'User001';
  String userImagePath = 'assets/image/profile.jpeg';

  List<MenuInfo> menuList = [
    MenuInfo('I don\'t', 'Your Likes', TmpScreen(), Icons.thumb_up_outlined),
    MenuInfo(
        'want to make', 'Your Reviews', TmpScreen(), Icons.reviews_outlined),
    MenuInfo('anymore', 'Tell your friends', TmpScreen(), Icons.people_outline),
  ];
}

class MenuInfo {
  String cd;
  String nm;
  Widget connectedScreen;
  IconData icon;

  MenuInfo(this.cd, this.nm, this.connectedScreen, this.icon);
}
