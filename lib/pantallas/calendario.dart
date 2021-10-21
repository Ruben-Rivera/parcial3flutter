import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Calendario extends StatefulWidget {
  Calendario({Key? key}) : super(key: key);

  @override
  _CalendarioState createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  TextEditingController id = TextEditingController();
  TextEditingController nombre = TextEditingController();
  TextEditingController idusuario = TextEditingController();
  TextEditingController fechain = TextEditingController();
  TextEditingController fechafin = TextEditingController();
  TextEditingController horain = TextEditingController();
  TextEditingController horafin = TextEditingController();
  TextEditingController detalles = TextEditingController();
  TextEditingController tipoENUM = TextEditingController();
  TextEditingController imgin = TextEditingController();
  TextEditingController imgfin = TextEditingController();


  final firebase = FirebaseFirestore.instance;

  create() async {
    try {
      await firebase.collection("calendario").doc(nombre.text).set({
        "idg": id.text,
        "nombre": nombre.text,
        "idusuario": idusuario.text,
        "fecha_ini": fechain.text,
        "fecha_fin": fechafin.text,
        "hora_ini": horain.text,
        "hora_fin": horafin.text,
        "detalles": detalles.text,
        "tipoENUM": tipoENUM.text,
        "img_ini": imgin.text,
        "img_fin":imgfin.text,
      });
    } catch (e) {
      print(e);
    }
  }

  update() async {
    try {
      firebase.collection("calendario").doc(nombre.text).update({
        "idg": id.text,
        "nombre": nombre.text,
        "idusuario": idusuario.text,
        "fecha_ini": fechain.text,
        "fecha_fin": fechafin.text,
        "hora_ini": horain.text,
        "hora_fin": horafin.text,
        "detalles": detalles.text,
        "tipoENUM": tipoENUM.text,
        "img_ini": imgin.text,
        "img_fin":imgfin.text,
      });
    } catch (e) {
      print(e);
    }
  }

  delete() async {
    try {
      firebase.collection("calendario").doc(nombre.text).delete();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crud del Calendario"),
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
                    labelText: "Id de Fecha",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: idusuario,
                decoration: InputDecoration(
                    labelText: "Id de usuario",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: nombre,
                decoration: InputDecoration(
                    labelText: "Nombre del Asunto",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: fechain,
                decoration: InputDecoration(
                    labelText: "Fecha de Inicio",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: fechafin,
                decoration: InputDecoration(
                    labelText: "Fecha de Finalizacion",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: horain,
                decoration: InputDecoration(
                    labelText: "Hora de Inicio",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: horafin,
                decoration: InputDecoration(
                    labelText: "Hora de Finalizacion",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: detalles,
                decoration: InputDecoration(
                    labelText: "Detalles",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: tipoENUM,
                decoration: InputDecoration(
                    labelText: "Tipo de Evento",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: imgin,
                decoration: InputDecoration(
                    labelText: "Imagen Inicial",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: imgfin,
                decoration: InputDecoration(
                    labelText: "Imagen Final",
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
                      fechain.clear();
                      fechafin.clear();
                      horain.clear();
                      horafin.clear();
                      detalles.clear();
                      tipoENUM.clear();
                      imgin.clear();
                      imgfin.clear();
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
                      fechain.clear();
                      fechafin.clear();
                      horain.clear();
                      horafin.clear();
                      detalles.clear();
                      tipoENUM.clear();
                      imgin.clear();
                      imgfin.clear();
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
                      fechain.clear();
                      fechafin.clear();
                      horain.clear();
                      horafin.clear();
                      detalles.clear();
                      tipoENUM.clear();
                      imgin.clear();
                      imgfin.clear();
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
                      stream: firebase.collection("calendario").snapshots(),
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
