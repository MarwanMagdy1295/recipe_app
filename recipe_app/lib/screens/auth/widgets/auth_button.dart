// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';

import '../../../core/color.dart';

GestureDetector authCustomButton({
  String? title,
  void Function()? onTap,
  width,
  Color bottomColor = kLightBlueColor,
  Color TextColor = kDeepBlueColor,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 60.0,
      decoration: BoxDecoration(
          color: bottomColor, borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(15),
      child: Center(
          child: Text(
        title!,
        style: TextStyle(
          color: TextColor,
          fontWeight: FontWeight.w600,
          fontSize: 16.0,
        ),
      )),
    ),
  );
}
