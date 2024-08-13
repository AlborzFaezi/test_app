
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_test/detail.dart';
// import 'package:test_test/detail.dart';
import 'package:test_test/object.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CatImageScreen(),
      routes: {
        '/detail' :(ctx) =>Detail(),
      },
    );
  }
}

class CatImageScreen extends StatefulWidget {

  const CatImageScreen({super.key});



  @override
  State<CatImageScreen> createState() => _CatImageScreenState();
}

class _CatImageScreenState extends State<CatImageScreen> {


  Future<Object>? myCode;


Future<Object> fetchObject()async{
  final response = await http.get(Uri.parse('https://api.restful-api.dev/objects/7'));
  if(response.statusCode == 200){
    return Object.fromJson(jsonDecode(response.body));
  } else{
    throw Exception('failed to load');
  }
}


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myCode = fetchObject();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Computer',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: Column(
            children: [
              FutureBuilder<Object>(
                  future: myCode,
                  builder: (context,snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      Object myObject = snapshot.data!;
                      return ListTile(
                        leading: CircleAvatar(child: Text(myObject.id),),
                        title: Text(myObject.name),
                        trailing: ElevatedButton(
                          onPressed: (){
                            Navigator.of(context).pushNamed('/detail',arguments:{
                              'data':myObject.data
                            } );
                          },
                          style:ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
                          child: Text('Details',style: TextStyle(color: Colors.yellow),),
                        ),
                      );
                    } else {
                      return Text(
                          'No data found'
                      ); // Handle the case where there's no data
                    }
                  }
              ),
            ],
          ),

    );
  }
// check this
}
