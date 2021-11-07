import 'dart:async';
import 'dart:convert';
import 'package:cartswing/model/data.dart';
import 'package:flutter/material.dart';

import 'homescreen.dart';
import 'package:http/http.dart' as http;

void main() { runApp(MyApp());}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}
class SplashScreenState extends State<MyHomePage> {
  late Future<Data> future;
  @override
  void initState() {
    super.initState();
    future=fetchData();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage('images/splash_scrn.png'),
          fit: BoxFit.cover,
        ),
      ),
      // child:FlutterLogo(size:MediaQuery.of(context).size.height)
      child: FutureBuilder(
        future: future,
        builder: (BuildContext context, AsyncSnapshot<Data> snapshot) {
          if (snapshot.hasData) {
            {
              Timer(Duration(seconds: 1),
                      ()=>Navigator.pushReplacement(context,
                      MaterialPageRoute(builder:
                          (context) => HomeScreen(todo:snapshot.data)
                      )
                  )
              );
              return Text("");
            }

          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const Center(child: CircularProgressIndicator());
        },

      ),
    );
  }


  Future<Data> fetchData() async {
    final response = await http
        .get(Uri.parse('https://csapi.piknpak.com.pk/index.php/rest/V1/mobileapi/menu'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Data data=Data.fromJson(jsonDecode(response.body)[0]);
      return data;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}


