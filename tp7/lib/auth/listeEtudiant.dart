import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tp7/AddEtud.dart';
import 'package:tp7/ListEtud.dart';
import 'package:tp7/auth/AddEtudiant.dart';
import 'package:tp7/auth/etudiant.dart';
import 'dart:convert';
import '../ListEtud.dart';
import 'ListEtudiantDialog.dart';

class listeEtudiant extends StatefulWidget {
  const listeEtudiant({ Key key }) : super(key: key);

  @override
  _listeEtudiantState createState() => _listeEtudiantState();
}

// ignore: camel_case_types
class _listeEtudiantState extends State<listeEtudiant> {
  List<dynamic>ListEtudiants;
  ListEtudiantDialog dialog = new ListEtudiantDialog();
  List<ListEtud> students;

  get children => null;


  @override
  Widget build(BuildContext context, {TextButton child}) {
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
            
             Dismissible(
              key:UniqueKey(),
              onDismissed:(direction){
                deletedEtud(ListEtudiants[index]['id']);
              }, child: null,
            );
    return  ListTile(
      
        title: Text(ListEtudiants[index]['nom']),
        subtitle: Text(
            'Prenom: ${ListEtudiants[index]['prenom']} - Date Nais:${ListEtudiants[index]['dateNais']}'),
            //onTap: () {},
            
        /*trailing: IconButton(
          icon: Icon(Icons.edit),
           onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) =>
                    dialog.buildAlert(context, ListEtudiants[index],
                        false));
          },
        ),*/

      );
      

            /*return Card(
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
             
                    
  
            );*/
          }
          ), 

  
    ),);

   
  }
  /*void delete(){
    Dismissible(
              key:UniqueKey(),
              onDismissed:(direction){
                deletedEtud(ListEtudiants[index]['id']);
              }, child: null,
            );

  }*/
  Future deletedEtud(int id) async {
    String url="http://192.168.56.1:8082/etudiants" ;
    final response=await http.delete(Uri.parse("$url/$id"));
     if (response.statusCode==200){
       return;
     }else{
       throw Exception("erreur");
     }
    
  }

  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      loadEtudiants();
     /* Container(
 child:RaisedButton(
   onPressed: () {

 Navigator.push(
 context,
 MaterialPageRoute(
 builder: (context) => AddEtud(),
 ));
 
 },
 child: Icon(Icons.add),
 

      ),
      );
  */   
    }
    void loadEtudiants(){
     // Etudiant etudiant = Etudiant("","","");
     String url = "http://192.168.56.1:8082/etudiants";
     http.get(Uri.parse(url)).then((resp){
          setState(() {
             this.ListEtudiants=json.decode(resp.body)['_embedded']['etudiants'];
                   
                    });
     }).catchError((err){
     print(err);
    });
}

  

}