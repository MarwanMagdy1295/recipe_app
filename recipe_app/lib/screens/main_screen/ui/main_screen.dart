import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:recipe_app/core/color.dart';
import 'package:recipe_app/core/constant.dart';
import 'package:recipe_app/core/loading.dart';
import 'package:recipe_app/screens/main_screen/ui/recipes_list.dart';
import 'package:recipe_app/screens/main_screen/ux/cubit.dart';
import 'package:recipe_app/screens/main_screen/ux/states.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MainScreenCubit()..getRecipeList(),
      child: Builder(
        builder: (context) {
          final cubit = context.watch<MainScreenCubit>();
          return BlocBuilder<MainScreenCubit, MainScreenStates>(
            builder: (state, index) {
              return SafeArea(
                child: Scaffold(
                  backgroundColor: kWhiteColor,
                  appBar: AppBar(
                    backgroundColor: kWhiteColor,
                    elevation: 0.0,
                    title: const Text(
                      'Food Recipe',
                      style: TextStyle(
                        color: kBlackColor,
                        fontSize: 26.0,
                      ),
                    ),
                  ),
                  body: Column(
                    children: [
                      heght10,
                      cubit.isLoading
                          ? const Expanded(child: CustomLoading())
                          : cubit.recipes.isEmpty
                              ? Expanded(
                                  child: Center(
                                    child: Lottie.network(
                                      'https://lottie.host/adb4e1de-85c5-4352-b20e-0d3f94f1b8fd/OSdBfj0V1y.json',
                                    ),
                                  ),
                                )
                              : RecipesList(cubit: cubit),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
