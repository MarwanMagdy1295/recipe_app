// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:io';
import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/color.dart';
import 'package:recipe_app/helpers/navigator_key.dart';
import 'package:recipe_app/screens/main_screen/data/models/recipe_list_model.dart';
import 'package:recipe_app/screens/main_screen/ux/cubit.dart';
import 'package:recipe_app/screens/main_screen/ux/states.dart';

class DetailsScreen extends StatelessWidget {
  final RecipeListModel recipe;
  const DetailsScreen({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          MainScreenCubit()..isRecipeFavorated(recipe),
      child: Builder(
        builder: (context) {
          final cubit = context.watch<MainScreenCubit>();
          return BlocBuilder<MainScreenCubit, MainScreenStates>(
            builder: (state, index) {
              return Scaffold(
                body: CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      systemOverlayStyle: const SystemUiOverlayStyle(
                          statusBarBrightness: Brightness.dark),
                      expandedHeight: Platform.isAndroid
                          ? MediaQuery.sizeOf(context).height * .37
                          : MediaQuery.sizeOf(context).height * .25,
                      backgroundColor: Colors.white,
                      elevation: 0.0,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Image.network(recipe.image ??
                            'https://media.istockphoto.com/id/1409329028/vector/no-picture-available-placeholder-thumbnail-icon-illustration-design.jpg?s=612x612&w=0&k=20&c=_zOuJu755g2eEUioiOUdz_mHKJQJn-tDgIAhQzyeKUQ='),
                        stretchModes: [
                          StretchMode.blurBackground,
                          StretchMode.zoomBackground,
                        ],
                      ),
                      bottom: PreferredSize(
                        preferredSize: Size.fromHeight(0.0),
                        child: Container(
                          height: 32.0,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32.0),
                              topRight: Radius.circular(32.0),
                            ),
                          ),
                        ),
                      ),
                      leadingWidth: 80.0,
                      leading: InkWell(
                        onTap: () {
                          RouteManager.pop();
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 0.0, top: 10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(56.0),
                            child: BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white.withOpacity(0.20),
                                ),
                                child: Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  size: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      actions: [
                        InkWell(
                          onTap: () {
                            RouteManager.pop();
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                                left: 0.0, top: 10.0, right: 16.0),
                            color: Colors.transparent,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(56.0),
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                                child: Container(
                                  padding: EdgeInsets.all(10.0),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white.withOpacity(0.20),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      recipe.isFavorite = !recipe.isFavorite!;
                                      cubit.isRecipeFavorated(recipe);
                                    },
                                    child: cubit.isFavorited == true
                                        ? Icon(
                                            Icons.favorite_rounded,
                                            size: 24.0,
                                            color: Colors.red,
                                          )
                                        : Icon(
                                            Icons.favorite_border_rounded,
                                            size: 24.0,
                                          ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10.0),
                                width: MediaQuery.sizeOf(context).width * .78,
                                child: Text(
                                  recipe.name ?? 'NA',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  // textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    color: kBlackColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 10.0, right: 10.0, bottom: 10.0),
                                padding: const EdgeInsets.all(4.0),
                                width: MediaQuery.sizeOf(context).width * .12,
                                decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: kBlackColor,
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
                                        color: kBlackColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            width: MediaQuery.sizeOf(context).width * .78,
                            child: Text(
                              'Ingredients:',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              // textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 20.0,
                                color: kBlackColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            width: MediaQuery.sizeOf(context).width,
                            child: DottedBorder(
                              dashPattern: [12.8],
                              padding: EdgeInsets.only(
                                  left: 10.0, top: 10.0, bottom: 10.0),
                              child: Wrap(
                                children: recipe.ingredients!
                                    .map(
                                      (e) => Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                .46,
                                        margin:
                                            EdgeInsets.symmetric(vertical: 4.0),
                                        child: Wrap(
                                          crossAxisAlignment:
                                              WrapCrossAlignment.center,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.0),
                                              height: 6.0,
                                              width: 6.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                                color: Colors.yellow,
                                              ),
                                            ),
                                            Container(
                                              margin:
                                                  EdgeInsets.only(left: 10.0),
                                              child: Text(
                                                e,
                                                style: const TextStyle(
                                                  fontSize: 14.0,
                                                  color: lightGreyColor,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 10.0, right: 10.0, top: 20.0),
                            width: MediaQuery.sizeOf(context).width * .78,
                            child: Text(
                              'Description',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              // textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 20.0,
                                color: kBlackColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            width: MediaQuery.sizeOf(context).width,
                            child: Text(
                              recipe.description!,
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: lightGreyColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
