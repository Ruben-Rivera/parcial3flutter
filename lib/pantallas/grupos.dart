import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Grupos extends StatefulWidget {
  Grupos({Key? key}) : super(key: key);

  @override
  _GruposState createState() => _GruposState();
}

class _GruposState extends State<Grupos> {
  TextEditingController id = TextEditingController();
  TextEditingController nombre = TextEditingController();
  TextEditingController idusuario = TextEditingController();
  TextEditingController tipoENUM = TextEditingController();
  TextEditingController publico = TextEditingController();

  final firebase = FirebaseFirestore.instance;

  create() async {
    try {
      await firebase.collection("grupos").doc(nombre.text).set({
        "idg": id.text,
        "nombre": nombre.text,
        "idusuario": idusuario.text,
        "tipoENUM": tipoENUM.text,
        "publico": publico.text,
      });
    } catch (e) {
      print(e);
    }
  }

  update() async {
    try {
      firebase.collection("grupos").doc(nombre.text).update({
        "idg": id.text,
        "nombre": nombre.text,
        "idusuario": idusuario.text,
        "tipoENUM": tipoENUM.text,
        "publico": publico.text,
      });
    } catch (e) {
      print(e);
    }
  }

  delete() async {
    try {
      firebase.collection("grupos").doc(nombre.text).delete();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crud de Grupos"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: id,
                decoration: InputDecoration(
                    labelText: "Id de Mensaje",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: nombre,
                decoration: InputDecoration(
                    labelText: "Nombre del Grupo",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: idusuario,
                decoration: InputDecoration(
                    labelText: "Id de Usuario",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: tipoENUM,
                decoration: InputDecoration(
                    labelText: "Tipo de Grupo",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: publico,
                decoration: InputDecoration(
                    labelText: "Tipo de Publico",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.lightGreen),
                    onPressed: () {
                      create();
                      id.clear();
                      nombre.clear();
                      idusuario.clear();
                      tipoENUM.clear();
                      publico.clear();
                    },
                    child: Text("Crear"),
                  ),
                  ElevatedButton(
                    style:
                        TextButton.styleFrom(backgroundColor: Colors.lightBlue),
                    onPressed: () {
                      update();
                      id.clear();
                      nombre.clear();
                      idusuario.clear();
                      tipoENUM.clear();
                      publico.clear();
                    },
                    child: Text("Modificar"),
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      delete();
                      id.clear();
                      nombre.clear();
                      idusuario.clear();
                      tipoENUM.clear();
                      publico.clear();
                    },
                    child: Text("Eliminar"),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Para *Actualizar* o *Eliminar* algun registro de la Firebase, escriba el Nombre correspondiente\n(El dato que aparece en negro, todos los campos con cambios se veran reflejados en la Firebase).",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                  height: 300,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    physics: ScrollPhysics(),
                    child: StreamBuilder<QuerySnapshot>(
                      stream: firebase.collection("grupos").snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, i) {
                                QueryDocumentSnapshot x =
                                    snapshot.data!.docs[i];
                                return ListTile(
                                  title: Text(
                                    x["nombre"],
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  subtitle: Text(x["tipoENUM"],
                                  style: TextStyle(fontSize: 18, color: Colors.red)),
                                );
                              });
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
