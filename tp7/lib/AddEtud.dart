import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:tp7/auth/etudiant.dart';
import 'package:google_fonts/google_fonts.dart';
class AddEtud extends StatefulWidget {
  const AddEtud({ Key key }) : super(key: key);

  @override
  _AddEtudState createState() => _AddEtudState();
}

class _AddEtudState extends State<AddEtud> {
final _formKey = GlobalKey<FormState>();

  String newValue;
  int _Student;
  String newValue1;
  Etudiant student = Etudiant("", "", "",);
  String url = "http://192.168.56.1:8082/etudiants";

  Future save(Student) async {
    print(Student.nom);
    print(Student.prenom);
    print(Student.dateNais);
    var res = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'nom': Student.nom,
          'prenom': Student.prenom,
          'dateNais': Student.dateNais,
        
        }));
    print(res.body);
    if (res.body != null) {
      Navigator.pop(context);
    }
  }

  TextEditingController nom = TextEditingController();
  TextEditingController prenom = TextEditingController();
  TextEditingController dateNais = TextEditingController();
  //TextEditingController classe_cod_class = TextEditingController();
  //TextEditingController formation_id = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Add Page')),
        body: Center(
            child: SingleChildScrollView(
                child: Form(
                    key: _formKey,
                    child: Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 570.0,
                            width: 340.0,
                            child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Text(
                                      "Add Student",
                                      style: GoogleFonts.asset(fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                        controller: nom,
                                        decoration: InputDecoration(
                                          hintText: "Nom",
                                          border: OutlineInputBorder(),
                                        )),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                        controller: prenom,
                                        decoration: InputDecoration(
                                          hintText: "Prenom",
                                          border: OutlineInputBorder(),
                                        )),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                        controller: dateNais,
                                        decoration: InputDecoration(
                                          hintText: "Date Naissance",
                                          border: OutlineInputBorder(),
                                        )),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          if (_formKey.currentState == null) {}
                                          if (_formKey.currentState
                                              .validate()) {
                                            save(Etudiant(nom.text, prenom.text,
                                                dateNais.text));
                                          }
                                        },
                                        child: Text("Add"))
                                  ],
                                )),
                          ),
                        ])))));
  }
}