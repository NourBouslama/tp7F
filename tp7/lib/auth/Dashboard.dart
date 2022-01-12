import 'package:flutter/material.dart';

import 'listeE.dart';
import 'listeEtudiant.dart';

class Dashboard extends StatelessWidget {
   const Dashboard({ Key key }) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(title: Text("Dashboard"),),
      /* body: Center(
         child:Text("Liste des etudiants.."),
       ),*/
       body: Center(
          child: RaisedButton(
                color: Colors.white,
                 child:Text("Liste des etudiants"),
                 onPressed: (){
                      Navigator.push(
                         context,
                            MaterialPageRoute(
                           builder: (context) => listeE(),
                           
                        ));
                 }
              ),
       ),
     
     );
   }
   

 }