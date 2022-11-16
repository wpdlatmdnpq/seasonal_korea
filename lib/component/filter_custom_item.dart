import 'package:flutter/material.dart';
import 'package:seasonal_korea_app/model/search_model.dart';
import 'package:seasonal_korea_app/util/constants.dart';

class FilterCustomItems extends StatelessWidget {
  FilterCustomItems({
    required this.model,
  });

  SearchModel model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: FilterItem.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              model.setSelectedFilter(index);
            },
            borderRadius: BorderRadius.circular(40),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black.withOpacity(0.38),
                  ),
                  borderRadius: BorderRadius.circular(40),
                  color: model.SelectedFilter == index
                      ? Theme.of(context).primaryColor
                      : Colors.transparent),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              child: Text(
                FilterItem[index].nm,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: model.SelectedFilter == index
                          ? Colors.white
                          : Colors.black.withOpacity(0.38),
                      fontSize: 13,
                    ),
              ),
            ),
          );
        },
      ),
    );
  }
}
