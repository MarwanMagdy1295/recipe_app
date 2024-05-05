// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import '../../../core/color.dart';
import '../../../core/constant.dart';

Column AuthCustomTextField({
  controller,
  title,
  hint,
  keyboardType,
  String? Function(String?)? validator,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(
          color: kSpecialGreyColor,
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      heght10,
      SizedBox(
        height: 50.0,
        child: TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(5),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.red,
                )),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(12.0)),
            filled: true,
            fillColor: kSpecialTextFieldBG,
            isDense: true,
            hintText: hint,
            hintStyle: const TextStyle(
              color: kSpecialTextFieldHintColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    ],
  );
}
