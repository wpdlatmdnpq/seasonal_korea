import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:seasonal_korea_app/component/card_item.dart';
import 'package:seasonal_korea_app/component/filter_custom_item.dart';
import 'package:seasonal_korea_app/component/header_custom.dart';
import 'package:seasonal_korea_app/component/horizontal_card_item.dart';
import 'package:seasonal_korea_app/component/search_custom_bar.dart';
import 'package:seasonal_korea_app/component/subtitle_with_button.dart';
import 'package:seasonal_korea_app/model/search_model.dart';
import 'package:seasonal_korea_app/page/detail_screen.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<SearchModel>(
      model: searchModel,
      child: ScopedModelDescendant<SearchModel>(
        builder: ((context, child, model) {
          return Scaffold(
            //resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderCustom(
                      isShowAlarmButton: true,
                      title: 'Place',
                      description: 'Make your beatiful memories.',
                    ),
                    SearchCustomBar(model: model),
                    FilterCustomItems(model: model),
                    SubTitleWithButton(
                      title: 'Popular place',
                      buttonTitle: 'View more',
                      onTab: () {},
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 3,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: model.Placelist.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: CardItem(
                                model: model,
                                index: index,
                                onCardTab: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                        item: model.Placelist[index],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          }),
                    ),
                    SubTitleWithButton(
                      title: 'Recommand',
                      buttonTitle: 'View more',
                      onTab: () {},
                    ),
                    Container(
                      child: model.Placelist.length == 0
                          ? Container()
                          : HorizontalCardItem(
                              imagePath: model.Placelist[0].imagePath,
                              name: model.Placelist[0].name,
                              location: model.Placelist[0].location,
                              overview: model.Placelist[0].overview,
                              isFavorite: model.Placelist[0].isFavorite,
                              toggleFavorite: () {
                                model.toggleFavorite(0);
                              },
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                      item: model.Placelist[0],
                                    ),
                                  ),
                                );
                              },
                            ),
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
