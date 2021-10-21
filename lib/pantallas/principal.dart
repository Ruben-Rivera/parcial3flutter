
import 'package:flutter/material.dart';
import 'opciones.dart';

class  Principal extends StatelessWidget {
  Principal ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Principal",
      home: Opciones(),
    );
  }
}