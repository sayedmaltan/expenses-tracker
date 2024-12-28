import 'package:expenses_tracker/pages/root_app.dart';
import 'package:expenses_tracker/theme/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light().copyWith(
      scaffoldBackgroundColor: white
    ),
    home: const RootApp(),
  ));
}
