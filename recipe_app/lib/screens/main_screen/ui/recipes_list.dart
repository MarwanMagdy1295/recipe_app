import 'package:flutter/material.dart';
import 'package:recipe_app/core/color.dart';
import 'package:recipe_app/helpers/navigator_key.dart';
import 'package:recipe_app/screens/main_screen/details_screen/ui/details_screen.dart';
// import 'package:recipe_app/core/constant.dart';
// import 'package:recipe_app/core/loading.dart';
// import 'package:recipe_app/helpers/navigator_key.dart';
import 'package:recipe_app/screens/main_screen/ux/cubit.dart';
// import 'package:recipe_app/screens/news_details_screen/ui/news_details_screen.dart';

class RecipesList extends StatelessWidget {
  const RecipesList({
    super.key,
    required this.cubit,
  });

  final MainScreenCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              itemCount: cubit.recipes.length,
              itemBuilder: (BuildContext context, int index) {
                final recipe = cubit.recipes[index];
                return InkWell(
                  onTap: () {
                    RouteManager.navigateTo(
                      DetailsScreen(
                        recipe: recipe,
                      ),
                    );
                  },
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * .25,
                    // padding: const EdgeInsets.all(16.0),
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    decoration: BoxDecoration(
                      color: lightGrey50Color,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                      image: DecorationImage(
                          image: NetworkImage(recipe.image ??
                              'https://media.istockphoto.com/id/1409329028/vector/no-picture-available-placeholder-thumbnail-icon-illustration-design.jpg?s=612x612&w=0&k=20&c=_zOuJu755g2eEUioiOUdz_mHKJQJn-tDgIAhQzyeKUQ='),
                          fit: BoxFit.fill),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * .7,
                              child: Text(
                                recipe.name ?? 'NA',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  color: kWhiteColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 10.0, bottom: 10.0),
                              padding: const EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(.4),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 16.0,
                                  ),
                                  const SizedBox(
                                    width: 4.0,
                                  ),
                                  Text(
                                    recipe.rating != null
                                        ? recipe.rating.toString()
                                        : 'NA',
                                    maxLines: 1,
                                    style: const TextStyle(
                                      fontSize: 12.0,
                                      color: kWhiteColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 10.0, bottom: 10.0),
                              padding: const EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(.4),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.access_time,
                                    color: Colors.yellow,
                                    size: 16.0,
                                  ),
                                  const SizedBox(
                                    width: 4.0,
                                  ),
                                  Text(
                                    recipe.time != null ? recipe.time! : 'NA',
                                    maxLines: 1,
                                    style: const TextStyle(
                                      fontSize: 12.0,
                                      color: kWhiteColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
