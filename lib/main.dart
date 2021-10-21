import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'pantallas/principal.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value){
  runApp(Parcial3());
});
}

class Parcial extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class Parcial3 extends StatefulWidget {
  Parcial3({Key? key}) : super(key: key);

  @override
  _Parcial3State createState() => _Parcial3State();
}

class _Parcial3State extends State<Parcial3> {
  
  @override
  Widget build(BuildContext context) {
    return Principal();
  }
}
