import 'package:flutter/material.dart';

import 'etudiant.dart';
class ListEtudiantDialog{
  final txtNom = TextEditingController();
  final txtPrenom = TextEditingController();
  final txtdatNais = TextEditingController();
  Widget buildAlert(BuildContext context, Etudiant etudiant, bool
  isNew) {
  
    if (!isNew) {
      txtNom.text = etudiant.nom;
      txtPrenom.text = etudiant.prenom;
      txtdatNais.text = etudiant.dateNais;
    }
    return AlertDialog(
        title: Text((isNew) ? 'New etudiant' : 'Edit studiant'),
    content: SingleChildScrollView(
    child: Column(
    children: <Widget>[
      TextField(
          controller: txtNom,
          decoration: InputDecoration(hintText: 'Student Name')),
      TextField(
        controller: txtPrenom,
        decoration: InputDecoration(hintText: 'First name'),
      ),
      TextField(
        controller: txtdatNais,
        decoration: InputDecoration(hintText: 'Date naissance'),
      ),
      RaisedButton(
          child: Text('Save etudiant'),
          onPressed: () {
            etudiant.nom = txtNom.text;
            etudiant.prenom = txtPrenom.text;
            etudiant.dateNais = txtdatNais.text;
           // helper.insertEtudiants(student);
            Navigator.pop(context);
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0)))
    ],
    ),
    ),
    );
  }


}