// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/custom_button.dart';
import 'package:recipe_app/screens/auth/sign_in/ui/loading.dart';
import 'package:recipe_app/screens/auth/sign_in/ux/states.dart';
import '../../../../core/color.dart';
import '../../../../core/constant.dart';
import '../ux/cubit.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SignInCubit(),
      child: Builder(
        builder: (context) {
          final cubit = context.watch<SignInCubit>();
          return BlocBuilder<SignInCubit, SignInStates>(
            builder: (BuildContext context, state) {
              return Scaffold(
                backgroundColor: kbackGroundColor,
                extendBodyBehindAppBar: true,
                body: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .08,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'SignIn',
                              style: TextStyle(
                                color: kWhiteColor,
                                fontSize: 24.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            // width10,
                            // Icon(
                            //   Icons.arrow_forward_rounded,
                            //   color: kWhiteColor,
                            // ),
                            // Spacer(),
                          ],
                        ),
                      ),
                      heght20,
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 80.0, left: 20.0, right: 20.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0)),
                            color: kWhiteColor,
                          ),
                          // height: MediaQuery.sizeOf(context).height,
                          child: Form(
                            key: cubit.formKey,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Row(
                                  //   mainAxisAlignment:
                                  //       MainAxisAlignment.center,
                                  //   children: [
                                  //     Text(
                                  //       '',
                                  //       style: TextStyle(
                                  //         color: kBlackColor,
                                  //         fontSize: 24.0,
                                  //         fontWeight: FontWeight.w800,
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                  // heght40,
                                  Text(
                                    'Email',
                                    style: TextStyle(
                                      color: lightGreyColor,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextFormField(
                                    controller: cubit.emailController,
                                    textInputAction: TextInputAction.next,
                                    style: TextStyle(
                                      fontFamily: 'Expo Arabic',
                                      fontSize: 16,
                                      color: kSpecialTextFieldHintColor,
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    // textAlign: TextAlign.right,
                                    validator: (value) {
                                      RegExp exp = RegExp(
                                          r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
                                      if (value!.isEmpty) {
                                        return 'Enter Email';
                                      } else if (!exp.hasMatch(value.trim())) {
                                        return 'Please Enter valid email';
                                      }
                                      return null;
                                      // value!.isEmpty ||
                                      //         exp.hasMatch(value.trim())
                                      //     ? 'Enter Email'
                                      //     : 'Please Enter valid email';
                                    },
                                    cursorColor: lightGreyColor,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      counterText: '',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: lightGreyColor,
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: lightGreyColor,
                                        ),
                                      ),
                                      disabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: lightGreyColor,
                                        ),
                                      ),
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: lightGreyColor,
                                        ),
                                      ),
                                      hintStyle: TextStyle(
                                        color: lightGreyColor,
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 16.0, horizontal: 16.0),
                                    ),
                                  ),
                                  heght30,
                                  Text(
                                    'Password',
                                    style: TextStyle(
                                      color: lightGreyColor,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextFormField(
                                    controller: cubit.passwordController,
                                    style: TextStyle(
                                      fontFamily: 'Expo Arabic',
                                      fontSize: 16,
                                      color: kSpecialTextFieldHintColor,
                                    ),
                                    obscureText: cubit.isHide,
                                    keyboardType: TextInputType.text,
                                    // textAlign: TextAlign.right,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Enter Password';
                                      }
                                      return null;
                                    },
                                    cursorColor: lightGreyColor,
                                    decoration: InputDecoration(
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          cubit.hidePassword();
                                        },
                                        child: cubit.isHide
                                            ? Icon(
                                                Icons.visibility_off_outlined,
                                                color: lightGreyColor,
                                              )
                                            : Icon(
                                                Icons.visibility_outlined,
                                                color: lightGreyColor,
                                              ),
                                      ),
                                      isDense: true,
                                      counterText: '',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: lightGreyColor,
                                        ),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 16.0, horizontal: 16.0),
                                    ),
                                  ),
                                  heght40,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Forget Password?',
                                        style: TextStyle(
                                          color: kBlackColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ],
                                  ),
                                  heght20,
                                  cubit.isLaoding
                                      ? CustomLoading()
                                      : customButton(
                                          onTap: () {
                                            if (cubit.formKey.currentState!
                                                    .validate() &&
                                                cubit.emailController.text !=
                                                    "" &&
                                                cubit.passwordController.text !=
                                                    "") {
                                              cubit.postLoginData();
                                            }
                                            // cubit.postLoginData();
                                          },
                                          TextColor: kWhiteColor,
                                          bottomColor: kbackGroundColor,
                                          title: 'SignIn',
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.5,
                                        ),
                                  heght20,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Don\u0027t have account? ',
                                        style: TextStyle(
                                            color: lightGreyColor,
                                            fontSize: 16.0),
                                      ),
                                      Text(
                                        'SignUp',
                                        style: TextStyle(
                                            color: kSpecialGreyColor,
                                            fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                  heght10,
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
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
