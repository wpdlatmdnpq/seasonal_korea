import 'package:flutter/material.dart';
import 'package:seasonal_korea_app/component/favorite_custom_button.dart';
import 'package:seasonal_korea_app/component/location_custom_text.dart';

class HorizontalCardItem extends StatelessWidget {
  HorizontalCardItem({
    required this.name,
    required this.imagePath,
    required this.location,
    required this.overview,
    required this.isFavorite,
    required this.toggleFavorite,
    required this.onTap,
  });

  String imagePath;
  String name;
  String location;
  String overview;
  bool isFavorite;
  Function toggleFavorite;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () {
          onTap();
        },
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 6,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    offset: Offset(3, 10),
                    blurRadius: 7,
                    spreadRadius: 0,
                  )
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: Image(
                          image: AssetImage(imagePath),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        LocationCustomText(
                          location: location,
                          fontSize: 10,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 10,
                          child: Text(
                            overview,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 11,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                top: 10,
                right: 10,
                child: FavoriteCustomButton(
                  isFavorite: isFavorite,
                  onTab: () {
                    toggleFavorite();
                  },
                ))
          ],
        ),
      ),
    );
  }
}
