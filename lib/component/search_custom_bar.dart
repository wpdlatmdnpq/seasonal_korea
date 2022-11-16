import 'package:flutter/material.dart';
import 'package:seasonal_korea_app/model/search_model.dart';

class SearchCustomBar extends StatelessWidget {
  SearchCustomBar({required this.model});
  SearchModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black.withOpacity(0.28),
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            offset: Offset(0, 1),
            blurRadius: 10,
            spreadRadius: 3,
          )
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 13),
      child: TextField(
        onSubmitted: (value) => model.searchData(value),
        decoration: InputDecoration(
          icon: Icon(
            Icons.search,
            color: Colors.black.withOpacity(0.3),
            size: 20,
          ),
          border: InputBorder.none,
          hintText: 'Search destination',
          hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Colors.black.withOpacity(0.3),
                fontSize: 12,
              ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
          isDense: true,
        ),
        textInputAction: TextInputAction.done,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12),
      ),
    );
  }
}
