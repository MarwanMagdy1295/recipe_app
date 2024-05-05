import 'package:flutter/material.dart';
import 'package:recipe_app/helpers/cash_helper.dart';
import 'package:recipe_app/helpers/di_service.dart';
import 'package:recipe_app/layout/app_layout.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashedHelper.init();
  await DiService.init();
  runApp(const AppLayout());
}
