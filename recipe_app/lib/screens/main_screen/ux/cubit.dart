import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/helpers/di_service.dart';
import 'package:recipe_app/screens/main_screen/data/models/recipe_list_model.dart';
import 'package:recipe_app/screens/main_screen/data/repository/main_screen_repository.dart';
import 'package:recipe_app/screens/main_screen/ux/states.dart';

class MainScreenCubit extends Cubit<MainScreenStates> {
  MainScreenCubit() : super(MainInitialState());
  static MainScreenCubit get(context) => BlocProvider.of(context);

  bool isLoading = false;
  final MainScreenRepository _mainScreenRepository =
      MainScreenRepository(mainScreenRepository: di());
  List<RecipeListModel> recipes = [];

  Future<void> getRecipeList() async {
    emit(MainLoadingState());
    isLoading = true;
    await _mainScreenRepository.getRecipeList().then((value) {
      recipes.addAll(value!);
      emit(MainLoadingState());
      isLoading = false;
    }).catchError((onError) {
      emit(MainLoadingState());
      isLoading = false;
    });
  }
}
