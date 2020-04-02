import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location,time,flag,url;
  bool isDT;

  WorldTime({this.location,this.url,this.flag});

  Future<void> getTime() async
  {
      Response response= await get('http://worldtimeapi.org/api/timezone/$url');
      Map date=jsonDecode(response.body);
      String datetime=date['datetime'];
      String offset=date['utc_offset'].substring(1,3);
      DateTime now=DateTime.parse(datetime);
      now = now.add(Duration(hours : int.parse(offset)));
      isDT = now.hour >= 6 && now.hour <18 ? true : false;
      time=DateFormat.jm().format(now);
  }

}