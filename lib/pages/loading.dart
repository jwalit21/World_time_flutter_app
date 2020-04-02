
import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';

//import 'dart:convert';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  Map location={};

  void setUpWorldTime() async{
    WorldTime instance = WorldTime(location: 'Berlin',url: 'Europe/Berlin',flag: 'germany.png');
    await instance.getTime();
    Navigator.pushReplacementNamed(context,'/home',arguments: {
      'location': instance.location,
      'url': instance.url,
      'time' : instance.time,
      'isDT' : instance.isDT,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    //location=ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      body: SpinKitRotatingCircle(
        color: Colors.white,
        size: 90.0,
      ),
    );
  }
}
