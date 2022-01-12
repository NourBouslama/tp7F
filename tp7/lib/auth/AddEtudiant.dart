import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:tp7/auth/etudiant.dart';

class AddEtudiant extends StatefulWidget {
  const AddEtudiant({ Key key }) : super(key: key);

  @override
  _AddEtudiantState createState() => _AddEtudiantState();
}

class _AddEtudiantState extends State<AddEtudiant> {
  Etudiant etudiant = Etudiant("","",'');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(title: Text("add etudiant"),),
body: Center(
  child: SingleChildScrollView(
 child: Form(
 //key: _formKey,
 child: Column(
 //mainAxisAlignment: MainAxisAlignment.center,
 //crossAxisAlignment: CrossAxisAlignment.center,
 children: <Widget>[
 Container(
 height: 570.0,
 width: 340.0,
 child:Padding(
  padding: const  EdgeInsets.all(10),
  child:Column(
  children: [
    Text(
      "New Etudiant",
      style: GoogleFonts.asset(fontSize: 20),
    ),
    TextFormField(
      controller: 
      TextEditingController(text:etudiant.prenom),
      decoration:InputDecoration(
        hintText: "Your Firstname ...",
        border:OutlineInputBorder(),
      )
    ),
    SizedBox(
      height: 20,
    ),
    TextFormField(
      obscureText: true,
      controller: 
      TextEditingController(text:etudiant.nom),
      decoration:InputDecoration(
        hintText: "Your Lastname ...",
        border:OutlineInputBorder(),
      )
    ),
     SizedBox(
      height: 20,
    ),
    TextFormField(
      obscureText: true,
      controller: 
      TextEditingController(text:etudiant.dateNais),
      decoration:InputDecoration(
        hintText: "Your  date naiss...",
        border:OutlineInputBorder(),
      )
    ),


  ],

  )
),),
 ]),),),)
 );
    }
}