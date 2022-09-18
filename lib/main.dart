import 'dart:convert';

import 'package:complex_api/modals/book_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}







class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  BookResponse? bookResponse;

  @override
  void initState() {
    super.initState();
    _getBooks();
  }

  _getBooks() async{

    try{
    var url=Uri.parse('https://www.googleapis.com/books/v1/volumes?q=react');
    var response=await http.get(url);
    var respStr=response.body;
    var decodedJson=jsonDecode(respStr) as Map<String,dynamic>;

    setState(() {

    this.bookResponse=BookResponse.fromJson(decodedJson);
    print('check** $bookResponse');

    });

    }
    catch(e){
      print("ERROR:$e");

    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Center(child: Text("Complex Api Practice")),
      ),
      body:
          ListView.builder(
              itemCount: bookResponse?.items?.length ?? 0,
              itemBuilder:(ctx,idx)=> ListTile(
                title: Text(bookResponse?.items![idx].volumeInfo?.title ?? ""),
                subtitle: Text(bookResponse?.items![idx].volumeInfo?.authors![0] ?? ""),
                leading: SizedBox(
                    height: 60,
                    width: 60,
                    child: Image.network('http://books.google.com/books/content?id=wgg7DwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api')),
              )

          )

    );
  }
}

