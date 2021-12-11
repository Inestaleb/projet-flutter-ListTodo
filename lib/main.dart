
import 'package:flutter/material.dart';
import 'package:projet/page/home_page.dart';
import 'package:projet/provider/todos.dart';
import 'package:provider/provider.dart';

void main() =>runApp( MyApp());


class MyApp extends StatelessWidget {
  static final String title = 'ToDo';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) =>ChangeNotifierProvider(
    create:(context)=> TodosProvider(),
    child:MaterialApp(

      debugShowCheckedModeBanner: false ,
      title: 'title',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor:Color(0xfff6f5ee),
      ),
      home: HomePage(),
    ),
  );
}


