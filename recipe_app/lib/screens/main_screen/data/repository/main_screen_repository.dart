import 'package:recipe_app/screens/main_screen/data/data_source/main_screen_remote_data_source.dart';
import 'package:recipe_app/screens/main_screen/data/models/recipe_list_model.dart';

abstract class MainScreenRepositoryInterface {
  Future<List<RecipeListModel>?> getRecipeList();
}

class MainScreenRepository extends MainScreenRepositoryInterface {
  final MainScreenRemoteDataSource _mainScreenRepository;

  MainScreenRepository({
    required MainScreenRemoteDataSource mainScreenRepository,
  }) : _mainScreenRepository = mainScreenRepository;

  @override
  Future<List<RecipeListModel>?> getRecipeList() async {
    try {
      final data = await _mainScreenRepository.getRecipeList();
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
