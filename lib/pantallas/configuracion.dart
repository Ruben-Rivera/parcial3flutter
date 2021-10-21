import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Configuracion extends StatefulWidget {
  Configuracion({Key? key}) : super(key: key);

  @override
  _ConfiguracionState createState() => _ConfiguracionState();
}

class _ConfiguracionState extends State<Configuracion> {
  TextEditingController id = TextEditingController();
  TextEditingController idusuario = TextEditingController();
  TextEditingController nombre = TextEditingController();
  TextEditingController valor = TextEditingController();

  final firebase = FirebaseFirestore.instance;

  create() async {
    try {
      await firebase.collection("configuracion").doc(nombre.text).set({
        "idc": id.text,
        "idusuario": idusuario.text,
        "nombre": nombre.text,
        "valor": valor.text,
      });
    } catch (e) {
      print(e);
    }
  }

  update() async {
    try {
      firebase.collection("configuracion").doc(nombre.text).update({
        "idc": id.text,
        "idusuario": idusuario.text,
        "nombre": nombre.text,
        "valor": valor.text,
      });
    } catch (e) {
      print(e);
    }
  }

  delete() async {
    try {
      firebase.collection("configuracion").doc(nombre.text).delete();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crud de Configuracion"),
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
                    labelText: "Id de Configuracion",
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
                controller: nombre,
                decoration: InputDecoration(
                    labelText: "Nombre de la Configuracion",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: valor,
                decoration: InputDecoration(
                    labelText: "Valor de la Configuracion",
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
                      idusuario.clear();
                      nombre.clear();
                      valor.clear();
                    },
                    child: Text("Crear"),
                  ),
                  ElevatedButton(
                    style:
                        TextButton.styleFrom(backgroundColor: Colors.lightBlue),
                    onPressed: () {
                      update();
                      id.clear();
                      idusuario.clear();
                      nombre.clear();
                      valor.clear();
                    },
                    child: Text("Modificar"),
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      delete();
                      id.clear();
                      idusuario.clear();
                      nombre.clear();
                      valor.clear();
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
                      stream: firebase.collection("configuracion").snapshots(),
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
                                  subtitle: Text(x["valor"],
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
