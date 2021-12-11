import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class HomePage extends StatefulWidget {
  get tacheList => [];

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  List tacheList = [];
  bool checked=false;
  List<bool> _isChecked = [];
  Map<String, bool>Checkboxlistvalue = {};
  getAllTache() async {
    var response = await http.get(
        Uri.parse("http://192.168.48.138:8080/flutter-Todo/tacheAll.php"));
    if (response.statusCode == 200) {
      setState(() {
        tacheList = json.decode(response.body);
      });
      print(tacheList);
      return tacheList;
    }
  }
  @override
  void initState() {
    super.initState();

    getAllTache();
    _isChecked = List<bool>.filled(tacheList.length,  false, growable: true);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tache a faire'),
      ),
      body:ListView.builder(
      itemCount: tacheList.length,
      itemBuilder: (context, index) {
        return CheckboxListTile(
          controlAffinity:ListTileControlAffinity.leading,
          title: Text(tacheList[index]['libellee'] ),
          activeColor: Colors.deepPurpleAccent,
          value:_isChecked[index],
            onChanged: (  val) {
            setState(
                  () {
                    _isChecked[index]=val!;
                  },
            );
          },
        );
      },
    ));
  }
}




