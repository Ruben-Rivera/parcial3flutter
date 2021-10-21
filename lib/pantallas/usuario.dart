import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Usuario extends StatefulWidget {
  Usuario({Key? key}) : super(key: key);

  @override
  _UsuarioState createState() => _UsuarioState();
}

class _UsuarioState extends State<Usuario> {
  TextEditingController id = TextEditingController();
  TextEditingController nivel = TextEditingController();
  TextEditingController usuario = TextEditingController();
  TextEditingController correo = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController nombre = TextEditingController();
  TextEditingController tiposet = TextEditingController();
  TextEditingController avatar = TextEditingController();

  final firebase = FirebaseFirestore.instance;

  create() async {
    try {
      await firebase.collection("usuarios").doc(usuario.text).set({
        "idu": id.text,
        "nivel": nivel.text,
        "usuario": usuario.text,
        "correo": correo.text,
        "password": password.text,
        "nombre": nombre.text,
        "tipo": tiposet.text,
        "avatar": avatar.text
      });
    } catch (e) {
      print(e);
    }
  }

  update() async {
    try {
      firebase.collection("usuarios").doc(usuario.text).update({
        "idu": id.text,
        "nivel": nivel.text,
        "usuario": usuario.text,
        "correo": correo.text,
        "password": password.text,
        "nombre": nombre.text,
        "tipo": tiposet.text,
        "avatar": avatar.text
      });
    } catch (e) {
      print(e);
    }
  }

  delete() async {
    try {
      firebase.collection("usuarios").doc(usuario.text).delete();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crud de Usuarios"),
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
                    labelText: "Id de Usuario",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: nivel,
                decoration: InputDecoration(
                    labelText: "Nivel de Usuario",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: usuario,
                decoration: InputDecoration(
                    labelText: "Usuario",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: correo,
                decoration: InputDecoration(
                    labelText: "Correo de Usuario",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: password,
                decoration: InputDecoration(
                    labelText: "Password de Usuario",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: nombre,
                decoration: InputDecoration(
                    labelText: "Nombre de Usuario",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: tiposet,
                decoration: InputDecoration(
                    labelText: "Tipo SET DE Usuario",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: avatar,
                decoration: InputDecoration(
                    labelText: "Avatar de Usuario",
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
                      nivel.clear();
                      usuario.clear();
                      correo.clear();
                      password.clear();
                      nombre.clear();
                      tiposet.clear();
                      avatar.clear();
                    },
                    child: Text("Crear"),
                  ),
                  ElevatedButton(
                    style:
                        TextButton.styleFrom(backgroundColor: Colors.lightBlue),
                    onPressed: () {
                      update();
                      id.clear();
                      nivel.clear();
                      usuario.clear();
                      correo.clear();
                      password.clear();
                      nombre.clear();
                      tiposet.clear();
                      avatar.clear();
                    },
                    child: Text("Modificar"),
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      delete();
                      id.clear();
                      nivel.clear();
                      usuario.clear();
                      correo.clear();
                      password.clear();
                      nombre.clear();
                      tiposet.clear();
                      avatar.clear();
                    },
                    child: Text("Eliminar"),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Para *Actualizar* o *Eliminar* algun registro de la Firebase, escriba el Usuario correspondiente\n(El dato que aparece en rojo, todos los campos con cambios se veran reflejados en la Firebase).",
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
                      stream: firebase.collection("usuarios").snapshots(),
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
                                  subtitle: Text(x["usuario"],
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
