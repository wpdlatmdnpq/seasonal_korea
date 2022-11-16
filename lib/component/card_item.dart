import 'package:flutter/material.dart';
import 'package:seasonal_korea_app/component/favorite_custom_button.dart';
import 'package:seasonal_korea_app/component/location_custom_text.dart';
import 'package:seasonal_korea_app/model/search_model.dart';

class CardItem extends StatelessWidget {
  CardItem({
    required this.model,
    required this.index,
    required this.onCardTab,
  });

  SearchModel model;
  int index;
  Function onCardTab;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onCardTab();
      },
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            width: 180,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  offset: Offset(0, 50),
                  blurRadius: 7,
                  spreadRadius: 0,
                )
              ],
            ),
            child: Material(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      // mainAxisAlignment:
                      //     MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          child: Text(
                            model.Placelist[index].name,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                        // Spacer(),
                        // Text(
                        //   TripType[model.Placelist[index].tripType].nm,
                        //   style:
                        //       Theme.of(context).textTheme.bodyText1!.copyWith(
                        //             fontSize: 11,
                        //             color: Colors.black.withOpacity(0.68),
                        //           ),
                        // )
                      ],
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    LocationCustomText(
                      location: model.Placelist[index].location,
                      fontSize: 10,
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
            width: 180,
            height: MediaQuery.of(context).size.height / 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                  fit: BoxFit.fitWidth,
                  image: AssetImage(model.Placelist[index].imagePath)),
            ),
          ),
          Positioned(
            right: 15,
            top: 10,
            child: FavoriteCustomButton(
              isFavorite: model.Placelist[index].isFavorite,
              onTab: () {
                model.toggleFavorite(index);
              },
            ),
          )
        ],
      ),
    );
  }
}
