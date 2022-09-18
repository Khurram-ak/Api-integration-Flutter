


import 'package:complex_api/modals/book.dart';

class BookResponse {
  int? totalItems;
  List<Book>? items;

  BookResponse({this.items,this.totalItems});

  factory BookResponse.fromJson(Map<String,dynamic> json){

    var bookResponse=BookResponse();
    bookResponse.totalItems=json["totalItems"];

    bookResponse.items=[];

    for(var jsonData in (json['items'] as List<dynamic>) ){
     var bookMap =jsonData as Map<String,dynamic>;
     bookResponse.items?.add(Book.fromJson(bookMap));

    }

    return bookResponse;
  }





}

