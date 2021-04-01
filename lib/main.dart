import 'package:flutter/material.dart';
import 'Home.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false, // remove debug banner
  theme: ThemeData.light(),
  home: InputBMI(),
));
