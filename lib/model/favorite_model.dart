import 'package:scoped_model/scoped_model.dart';
import 'package:seasonal_korea_app/data.dart';
import 'package:seasonal_korea_app/model/search_model.dart';

class FavoriteModel extends Model {
  List<Sample> _favoriteList = [];

  List<Sample> get FavoriteList => _favoriteList;

  void initFavoriteList() {
    _favoriteList = [];
    searchModel.Placelist.forEach((element) {
      if (element.isFavorite) {
        _favoriteList.add(element);
      }
    });
  }

  void toggleFavorite(int index) {
    searchModel.Placelist[index].isFavorite =
        !searchModel.Placelist[index].isFavorite;
    notifyListeners();
  }
}
