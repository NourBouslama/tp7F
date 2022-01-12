import 'dart:convert';
import 'auth/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'login.dart';
class Register extends StatefulWidget {
 Register({Key key}) : super(key: key);
 @override
 _RegisterState createState() => _RegisterState();
}
class _RegisterState extends State<Register> {
    final _formKey = GlobalKey<FormState>();
  User user = User("", "");
  String url = "http://192.168.56.1:8082/register";

  Future save(user) async {
    print(user.email);
    var res = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': user.email, 'password': user.password}));
    print(res.body);
    if (res.body != null) {
      Navigator.pop(context);
    }
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Text(
                          "Register",
                          style: GoogleFonts.asset(fontSize: 20),
                        ),
                        TextFormField(
                            controller: email,
                            decoration: InputDecoration(
                              hintText: "Your email ...",
                              border: OutlineInputBorder(),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                            obscureText: true,
                            controller: password,
                            decoration: InputDecoration(
                              hintText: "Your password ...",
                              border: OutlineInputBorder(),
                            )),
                        ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState == null) {}
                              if (_formKey.currentState.validate()) {
                                save(User(email.text, password.text));
                              }
                            },
                            child: Text("Register"))
                      ],
                    )))));
  }
/*final _formKey = GlobalKey<FormState>();
User user = User("", "");
String url = "http://192.168.56.1:8082/registre";


Future save() async {
 var res = await http.post(Uri.parse(url),
 headers: {'Content-Type': 'application/json'},
 body: json.encode({'email': user.email, 'password': user.password}));
  print(res.body);
 if (res.body != null) {
 Navigator.push(
 context,
 MaterialPageRoute(
 builder: (context) => Login(),
 ));
 }
 
 }
  
  @override
Widget build(BuildContext context) {
 return Scaffold(
 body: Center(
 child: SingleChildScrollView(
 child: Form(
 key: _formKey,
 child: Column(
children: <Widget>[
 Container(
 height: 570.0,
 width: 340.0,
 child:Padding(
  padding: const  EdgeInsets.all(10),
  child:Column(
  children: [
    Text(
      "Registre",
      style: GoogleFonts.asset(fontSize: 20),
    ),
    TextFormField(
      controller: 
      TextEditingController(text:user.email),
      decoration:InputDecoration(
        hintText: "Your email ...",
        border:OutlineInputBorder(),
      )
    ),
    SizedBox(
      height: 20,
    ),
    TextFormField(
      obscureText: true,
      controller: 
      TextEditingController(text:user.password),
      decoration:InputDecoration(
        hintText: "Your password ...",
        border:OutlineInputBorder(),
      )
    ),


  ],

  )
),),
Container(
  child: TextButton(
    onPressed: () { 
      if(_formKey.currentState==null){ 
        return;
      }
      if(_formKey.currentState.validate()){
        save();
      }
    },
    child: Icon(
     Icons.arrow_forward
      ),
  ),
)
/*new TextField(
decoration: new InputDecoration(hintText: "enter your password",labelText:"Email"),
//validator: (text) => text.isEmpty ? 'User Name is required' : '',
),
new TextField(
decoration: new InputDecoration(hintText: "enter your password",labelText:"Email"),
//validator: (text) => text.isEmpty ? 'User Name is required' : '',
)*/

]

   
 )
 ))));}
*/

}
