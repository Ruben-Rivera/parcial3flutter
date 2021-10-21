import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Mensaje extends StatefulWidget {
  Mensaje({Key? key}) : super(key: key);

  @override
  _MensajeState createState() => _MensajeState();
}

class _MensajeState extends State<Mensaje> {
  TextEditingController id = TextEditingController();
  TextEditingController idde = TextEditingController();
  TextEditingController idpara = TextEditingController();
  TextEditingController titulo = TextEditingController();
  TextEditingController mensaje = TextEditingController();
  TextEditingController idgrupo = TextEditingController();
  TextEditingController fecha = TextEditingController();
  TextEditingController hora = TextEditingController();
  TextEditingController tags = TextEditingController();

  final firebase = FirebaseFirestore.instance;

  create() async {
    try {
      await firebase.collection("mensajes").doc(titulo.text).set({
        "idm": id.text,
        "idu_de": idde.text,
        "idu_para": idpara.text,
        "titulo": titulo.text,
        "mensaje": mensaje.text,
        "idgrupo": idgrupo.text,
        "fecha": fecha.text,
        "hora": hora.text,
        "tags": tags.text,
      });
    } catch (e) {
      print(e);
    }
  }

  update() async {
    try {
      firebase.collection("mensajes").doc(titulo.text).update({
        "idm": id.text,
        "idu_de": idde.text,
        "idu_para": idpara.text,
        "titulo": titulo.text,
        "mensaje": mensaje.text,
        "idgrupo": idgrupo.text,
        "fecha": fecha.text,
        "hora": hora.text,
        "tags": tags.text,
      });
    } catch (e) {
      print(e);
    }
  }

  delete() async {
    try {
      firebase.collection("mensajes").doc(titulo.text).delete();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crud de Mensajes"),
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
                controller: idde,
                decoration: InputDecoration(
                    labelText: "Id de Emisor",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: idpara,
                decoration: InputDecoration(
                    labelText: "Id de Receptor",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: titulo,
                decoration: InputDecoration(
                    labelText: "Titulo de Mensaje",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: mensaje,
                decoration: InputDecoration(
                    labelText: "Mensaje",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: idgrupo,
                decoration: InputDecoration(
                    labelText: "Id de Grupo",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: fecha,
                decoration: InputDecoration(
                    labelText: "Fecha de Envio",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: hora,
                decoration: InputDecoration(
                    labelText: "Hora de Envio",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: tags,
                decoration: InputDecoration(
                    labelText: "Tags del Mensaje",
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
                      idde.clear();
                      idpara.clear();
                      titulo.clear();
                      mensaje.clear();
                      idgrupo.clear();
                      fecha.clear();
                      hora.clear();
                      tags.clear();
                    },
                    child: Text("Crear"),
                  ),
                  ElevatedButton(
                    style:
                        TextButton.styleFrom(backgroundColor: Colors.lightBlue),
                    onPressed: () {
                      update();
                      id.clear();
                      idde.clear();
                      idpara.clear();
                      titulo.clear();
                      mensaje.clear();
                      idgrupo.clear();
                      fecha.clear();
                      hora.clear();
                      tags.clear();
                    },
                    child: Text("Modificar"),
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      delete();
                      id.clear();
                      idde.clear();
                      idpara.clear();
                      titulo.clear();
                      mensaje.clear();
                      idgrupo.clear();
                      fecha.clear();
                      hora.clear();
                      tags.clear();
                    },
                    child: Text("Eliminar"),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Para *Actualizar* o *Eliminar* algun registro de la Firebase, escriba el Titulo correspondiente\n(El dato que aparece en negro, todos los campos con cambios se veran reflejados en la Firebase).",
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
                      stream: firebase.collection("mensajes").snapshots(),
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
                                    x["titulo"],
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  subtitle: Text(x["mensaje"],
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
