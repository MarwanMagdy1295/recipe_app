// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:recipe_app/helpers/dio_helper.dart';
import 'package:recipe_app/helpers/error_handler.dart';
import 'package:recipe_app/screens/main_screen/data/models/recipe_list_model.dart';

abstract class MainScreenRemoteDataSourceInterface {
  Future<List<RecipeListModel>?> getRecipeList();
}

class MainScreenRemoteDataSource extends MainScreenRemoteDataSourceInterface {
  final NetworkService _networkService;

  MainScreenRemoteDataSource({
    required NetworkService networkService,
  }) : _networkService = networkService;

  @override
  Future<List<RecipeListModel>?> getRecipeList() async {
    var res;
    try {
      res = await _networkService.getData(
        url: '43427003d33f1f6b51cc',
        token: true,
        query: {},
      );
      return List<RecipeListModel>.from(
          res.data.map((x) => RecipeListModel.fromJson(x)));
    } catch (e) {
      throw ErrorModel.parse(e);
    }
  }
}
