// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/helpers/navigator_key.dart';
import 'package:recipe_app/screens/auth/sign_in/model/model.dart';
import 'package:recipe_app/screens/auth/sign_in/ux/states.dart';
import 'package:recipe_app/screens/main_screen/ui/main_screen.dart';

class SignInCubit extends Cubit<SignInStates> {
  SignInCubit() : super(SignInInitialState());
  // AuthRepository? _authRepository;
  // SignInCubit({
  //   AuthRepository? authRepository,
  // })  : _authRepository = authRepository,
  //       super(SignInInitialState());
  static SignInCubit get(context) => BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLaoding = false;
  bool isHide = true;
  final formKey = GlobalKey<FormState>();
  UserData? user = UserData();

  hidePassword() {
    emit(SignInHidePasswordState());
    isHide = !isHide;
    print(isHide);
    emit(SignInHidePasswordState());
  }

  Future<void> postLoginData() async {
    if (formKey.currentState!.validate()) {
      isLaoding = true;
      emit(SignInLoadingState());
      // await _authRepository
      //     .login(
      //         body: AuthLoginRequestModel(
      //   phoneNumber: emailController.text,
      //   password: passwordController.text,
      // ))
      await Future.delayed(const Duration(milliseconds: 300), () {
        print("This is printed after 5 seconds.");
      }).then((value) {
        emit(SignInLoadingState());
        isLaoding = false;
        RouteManager.navigateAndPopAll(
          const MainScreen(),
        );
      }).catchError((onError) {
        emit(SignInLoadingState());
        isLaoding = false;
        print('login error=>  $onError');
      });
    }
  }
}
