import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/load_data.dart';

void main() => runApp(MyApp());

Future<LoadData> apiCall() async {
  final response = await http.get(
      "https://raw.githubusercontent.com/alimcevik/jsonapi/master/api.json");

  if (response == 200) {
    return LoadData.fromJson(json.decode(response.body));
  } else {
    throw Exception("Bir hata oluştu!");
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "API",
      home: Scaffold(
        appBar: AppBar(
          title: new Text("Api"),
        ),
        body: FutureBuilder<LoadData>(
          future: apiCall(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return new Container(
                child: new Center(
                  child: new Text(
                    "kullanıcı adı: ${snapshot.data.username}" +
                        "e-posta: ${snapshot.data.email}",
                    style: new TextStyle(
                        color: Colors.redAccent, fontWeight: FontWeight.bold),
                  ),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
