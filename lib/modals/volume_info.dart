

import 'package:complex_api/modals/image_links.dart';

class VolumeInfo {

  String? title;
  List<String>? authors;
  ImageLinks? imageLinks;

  VolumeInfo({this.imageLinks,this.title,this.authors});

  factory VolumeInfo.fromJson(Map<String,dynamic> json){

    var volumnInfo=VolumeInfo();
    volumnInfo.title=json['title'];

    volumnInfo.authors=[];
    for(var item in json['authors'] as List<dynamic>){
      volumnInfo.authors?.add(item);
    }
  
    volumnInfo.imageLinks=ImageLinks.fromJson(json["imageLinks"] as Map<String,dynamic>);

    return volumnInfo;
  }



}