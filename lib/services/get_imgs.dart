import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class RandomImgs{
  String apiEndpoint = "https://api.pexels.com/v1/curated/?page=1&per_page=15";
  List urls = [];
  List photos = [];

  Future<void> getImgs() async{
    Response response = await get(Uri.parse(apiEndpoint), headers: {'Authorization':'563492ad6f917000010000019773aba64d6d43619bf9cb561d323578'});
    Map data = jsonDecode(response.body);
    photos = data["photos"];
    for(var i = 0; i < photos.length; i++){
      urls.add({"small": photos[i]["src"]["tiny"], "photographer": photos[i]["photographer"], "original":photos[i]["src"]["original"], "photographer_url": photos[i]["photographer_url"], "alt": photos[i]["alt"]});
    }
    urls = List.from(urls.reversed);
  }
}
