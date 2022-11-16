import 'package:scoped_model/scoped_model.dart';
import 'package:seasonal_korea_app/data.dart';

SearchModel searchModel = SearchModel();

class SearchModel extends Model {
  int _selectedFilter = 0;
  String _searchData = '';
  List<Sample> placelist = getSample();
  // Sample recommand = getRecommand();

  void searchData(String input) {
    _searchData = input;
    //TODO Search
    //placelist = getSample();
    notifyListeners();
  }

  int get SelectedFilter => _selectedFilter;
  void setSelectedFilter(int value) {
    _selectedFilter = value;
    List<Sample> newList = [];
    List<Sample> allList = getSample();
    if (value != 0) {
      allList.forEach(
        (element) {
          if (element.season == value) {
            newList.add(element);
          }
        },
      );
      placelist = newList;
    } else {
      placelist = allList;
    }

    notifyListeners();
  }

  List<Sample> get Placelist => placelist;

  void toggleFavorite(int index) {
    placelist[index].isFavorite = !placelist[index].isFavorite;
    notifyListeners();
  }
}
