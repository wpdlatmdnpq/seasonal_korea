import 'package:flutter/material.dart';
import 'package:seasonal_korea_app/model/search_model.dart';

class FavoriteCustomButton extends StatelessWidget {
  FavoriteCustomButton({
    required this.isFavorite,
    required this.onTab,
  });

  bool isFavorite;
  Function onTab;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTab();
      },
      borderRadius: BorderRadius.circular(100),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              offset: Offset(0, 1),
              blurRadius: 10,
              spreadRadius: 3,
            )
          ],
        ),
        width: 30,
        height: 30,
        child: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_outline,
          color: isFavorite
              ? Colors.red.withOpacity(0.76)
              : Colors.black.withOpacity(0.58),
          size: 20,
        ),
      ),
    );
  }
}
