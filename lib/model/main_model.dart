import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:seasonal_korea_app/page/favorite_screen.dart';
import 'package:seasonal_korea_app/page/profile_screen.dart';
import 'package:seasonal_korea_app/page/search_screen.dart';
import 'package:seasonal_korea_app/util/constants.dart';

class MainModel extends Model {
  Widget selectedScreen = SearchScreen();
  List<Widget> screens = [
    SearchScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];
  NaviItem _selectedNavi = NaviItem.home;

  void setSelectedNavi(NaviItem value) {
    if (_selectedNavi == value) {
      return;
    } else {
      _selectedNavi = value;
      if (_selectedNavi == NaviItem.home) {
        selectedScreen = screens[0];
      } else if (_selectedNavi == NaviItem.favorite) {
        selectedScreen = screens[1];
      } else if (_selectedNavi == NaviItem.profile) {
        selectedScreen = screens[2];
      }
    }

    notifyListeners();
  }

  bool isSelectedNavi(NaviItem value) {
    bool isSelected = false;
    if (_selectedNavi == value) {
      isSelected = true;
    }
    return isSelected;
  }
}
