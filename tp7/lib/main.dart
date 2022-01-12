import 'package:flutter/material.dart';
import 'login.dart';
/*void main() {
 runApp(MaterialApp(
 debugShowCheckedModeBanner: false,
 home: Login(),
 ));

 
}*/
void main() async {
  /*WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();*/
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login and Register Manager",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home:  Login(),
    );
  } 
}
