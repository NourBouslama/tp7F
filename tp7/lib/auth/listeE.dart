import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tp7/AddEtud.dart';
import 'package:tp7/ListEtud.dart';
import 'package:tp7/auth/AddEtudiant.dart';
import 'package:tp7/auth/etudiant.dart';
import 'dart:convert';
import '../ListEtud.dart';
import 'ListEtudiantDialog.dart';

class listeE extends StatefulWidget {
  const listeE({ Key key }) : super(key: key);

  @override
  _listeEState createState() => _listeEState();
}

class _listeEState extends State<listeE> {

 List<dynamic>ListEtudiants;
  ListEtudiantDialog dialog = new ListEtudiantDialog();
  List<ListEtud> students;

  get children => null;
  @override
  Widget build(BuildContext context) {
          final ButtonStyle style = TextButton.styleFrom(
        primary: Theme.of(context).colorScheme.onBackground);
    return Scaffold(
  appBar: AppBar(title: Text('Etudiant'),
      actions: <Widget>[
          TextButton(
            style: style,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddEtud()));
            },
            child: const Text('+ Add'),
          ),
        ],
      ),
       body:Center(
        
        
        child:this.ListEtudiants==null? CircularProgressIndicator():
        ListView.builder(
          itemCount: (this.ListEtudiants==null)?0:this.ListEtudiants.length,
          itemBuilder: (context,index){

                  return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      deletedEtud(ListEtudiants[index]['id']);
                    },
                    child: GestureDetector(
                      onTap: () {
                  
                      },
                       child:Card(
              color: Colors.blueAccent,
             
               child: RaisedButton(
                color: Colors.white,
                 child:Text(this.ListEtudiants[index]['nom']['prenom']['dateNais'],
                 //child:Text('Prenom ${this.ListEtudiants[index].prenom} - Nom:${this.ListEtudiants[index].nom} -Date Nais:${this.ListEtudiants[index].dateNais}'),
               //  'Prenom: ${students[index].prenom} - Date Nais:${students[index].datNais}'),
                style:TextStyle(color: Colors.black)),
                 onPressed: (){
                     
                 }
              ),
            )
                      /*child: Card(
                          color: Colors.lightBlueAccent,
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(this.ListEtudiants[index]['nom']))),*/
                    ),
                  );
                }),
      ),
    );
  }
  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      //loadEtudiants();}

    }
    Future deletedEtud(int id) async {
    String url="http://192.168.56.1:8082/etudiants" ;
    final response=await http.delete(Uri.parse("$url/$id"));
     if (response.statusCode==200){
       return;
     }else{
       throw Exception("erreur");
     }
    
  }
}


  