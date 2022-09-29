import 'package:flutter/material.dart';
import 'package:pdfgenrate/views/steps_views.dart';

import 'controlers/apptexteditingcontroler.dart';

void main() {
  runApp(MaterialApp(
      home:MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StepsScreen();
  }
}

