import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:scoped_model/scoped_model.dart';

class Sample extends Model {
  String imagePath;
  String name;
  String location;
  int season;
  int tripType;
  String overview;
  bool isFavorite;
  int likeCnt;
  bool isLike;
  bool isCollapsed;
  Sample(
    this.imagePath,
    this.name,
    this.location,
    this.season,
    this.tripType,
    this.overview,
    this.isFavorite,
    this.likeCnt,
    this.isLike,
    this.isCollapsed,
  );

  String Season() {
    String rVal = '';
    switch (season) {
      case 1:
        rVal = 'Spring';
        break;
      case 2:
        rVal = 'Summer';
        break;
      case 3:
        rVal = 'Autumn';
        break;
      case 4:
        rVal = 'Winter';
        break;
    }
    return rVal;
  }

  void IsLike() {
    isLike = !isLike;
    if (isLike) {
      likeCnt += 1;
    } else {
      if (likeCnt > 0) {
        likeCnt -= 1;
      }
    }

    notifyListeners();
  }

  void initCollapsed() {
    isCollapsed = false;
  }
}

Sample getRecommand() {
  return Sample(
    'assets/image/autumn_picnicpark_d.JPG',
    'Picnic Park',
    'Gyeonggi-do Pyeongtaek',
    3,
    0,
    lorem(
      paragraphs: 1,
      words: 200,
    ),
    false,
    32,
    false,
    false,
  );
}

List<Sample> getSample() {
  List<Sample> list = [];
  list.add(
    Sample(
      'assets/image/autumn_picnicpark_d.JPG',
      'Picnic Park',
      'Gyeonggi-do Pyeongtaek',
      3,
      0,
      lorem(
        paragraphs: 1,
        words: 200,
      ),
      false,
      32,
      false,
      false,
    ),
  );
  list.add(
    Sample(
      'assets/image/autumn_wonju_sogumsan.png',
      'Sogumsan',
      'Kangwon-do Wonju',
      3,
      1,
      lorem(
        paragraphs: 3,
        words: 300,
      ),
      false,
      105,
      false,
      false,
    ),
  );
  list.add(
    Sample(
      'assets/image/expopark.JPG',
      'EXPO Park',
      'Daejeon Yuseong-gu',
      2,
      0,
      lorem(
        paragraphs: 1,
        words: 500,
      ),
      false,
      365,
      false,
      false,
    ),
  );
  list.add(
    Sample(
      'assets/image/saebyeoloreum.JPG',
      'Saebyeol Oreum',
      'Jeju Aewol-eup',
      3,
      0,
      lorem(
        paragraphs: 2,
        words: 500,
      ),
      false,
      365,
      false,
      false,
    ),
  );
  list.add(
    Sample(
      'assets/image/autumn_heyri.png',
      'Heyri Village',
      'Gyeonggi-do Paju',
      3,
      0,
      lorem(
        paragraphs: 2,
        words: 300,
      ),
      false,
      50,
      false,
      false,
    ),
  );

  return list;
}
