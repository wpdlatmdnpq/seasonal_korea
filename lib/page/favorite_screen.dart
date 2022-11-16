import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:seasonal_korea_app/component/header_custom.dart';
import 'package:seasonal_korea_app/component/horizontal_card_item.dart';
import 'package:seasonal_korea_app/data.dart';
import 'package:seasonal_korea_app/model/favorite_model.dart';
import 'package:seasonal_korea_app/page/detail_screen.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen();
  FavoriteModel model = FavoriteModel();
  @override
  Widget build(BuildContext context) {
    model.initFavoriteList();
    return ScopedModel<FavoriteModel>(
        model: model,
        child: ScopedModelDescendant<FavoriteModel>(
          builder: ((context, child, model) {
            return SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    HeaderCustom(
                        isShowAlarmButton: false,
                        title: 'Favorite',
                        description: model.FavoriteList.isEmpty
                            ? 'Save where you want to go.'
                            : 'Make a wish come true.'),
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          Sample item = model.FavoriteList[index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: HorizontalCardItem(
                                name: item.name,
                                imagePath: item.imagePath,
                                location: item.location,
                                overview: item.overview,
                                isFavorite: item.isFavorite,
                                toggleFavorite: () {
                                  model.toggleFavorite(index);
                                },
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (contexxt) => DetailScreen(
                                        item: item,
                                      ),
                                    ),
                                  );
                                }),
                          );
                        },
                        itemCount: model.FavoriteList.length,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ));
    // return Scaffold(
    //   body: SingleChildScrollView(
    //     child: Container(
    //       height: MediaQuery.of(context).size.height,
    //       child: ListView.builder(
    //         scrollDirection: Axis.vertical,
    //         shrinkWrap: true,
    //         itemBuilder: ((context, index) {
    //           Sample sample = Favori
    //           return HorizontalCardItem(name: name, imagePath: imagePath, location: location, overview: overview, isFavorite: isFavorite, setFavorite: setFavorite)
    //         }),
    //         itemCount: 100,
    //       ),
    //     ),
    //   ),
    // );
  }
}
