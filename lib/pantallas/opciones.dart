import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:parcial32514342017/pantallas/calendario.dart';
import 'package:parcial32514342017/pantallas/configuracion.dart';
import 'package:parcial32514342017/pantallas/grupos.dart';
import 'package:parcial32514342017/pantallas/mensaje.dart';
import 'package:parcial32514342017/pantallas/principal.dart';
import 'package:parcial32514342017/pantallas/usuario.dart';

class Opciones extends StatefulWidget {
  Opciones({Key? key}) : super(key: key);

  @override
  _OpcionesState createState() => _OpcionesState();
}

class _OpcionesState extends State<Opciones> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Parcial 3"),),
        body: Container(
          width: double.infinity,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Seleccione la tabla a modificar en Firebase", 
            style: 
          TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,),),
            SizedBox(
                height: 45,
              ),
              MaterialButton(
                minWidth: 200.0,
                height: 40.0,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Calendario();
                  }));
                },
                color: Colors.yellow,
                child:
                    Text('Calendario', style: TextStyle(color: Colors.black)),
              ),
              SizedBox(
                height: 25,
              ),
              MaterialButton(
                minWidth: 200.0,
                height: 40.0,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Configuracion();
                  }));
                },
                color: Colors.purpleAccent,
                child:
                    Text('Configuracion', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(
                height: 25,
              ),
              MaterialButton(
                minWidth: 200.0,
                height: 40.0,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Grupos();
                  }));
                },
                color: Colors.pinkAccent,
                child:
                    Text('Grupos', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(
                height: 25,
              ),

              MaterialButton(
                minWidth: 200.0,
                height: 40.0,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Mensaje();
                  }));
                },
                color: Colors.lightGreen,
                child:
                    Text('Mensajes', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(
                height: 25,
              ),
              MaterialButton(
                minWidth: 200.0,
                height: 40.0,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Usuario();
                  }));
                },
                color: Colors.lightBlue,
                child:
                    Text('Usuarios', style: TextStyle(color: Colors.white)),
              ),
          ],
        )
        )

    );
  }
}