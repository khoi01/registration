import 'package:app_register/ui/home/UserHomeView.dart';
import 'package:flutter/material.dart';

import 'Util/db.dart';

 
// void main() => runApp(MyApp());
 
 void main() async{
	WidgetsFlutterBinding.ensureInitialized();
  	await DB.init();
	runApp(MyApp());
 }
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: UserHomeView()
    );
  }
}