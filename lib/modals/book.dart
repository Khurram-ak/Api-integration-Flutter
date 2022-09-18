
import 'package:complex_api/modals/volume_info.dart';

class Book {
  String? id;
  VolumeInfo? volumeInfo;

  Book({this.volumeInfo,this.id});

  factory Book.fromJson(Map<String,dynamic> json){

    var book=Book();
    book.id=json['id'];

    book.volumeInfo =VolumeInfo.fromJson(json["volumeInfo"]);

    return book;

  }



}
