

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Map data={};
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    String bgImage = data['isDT'] ? 'day.png' : 'night.png';
    Color color = data['isDT'] ? Colors.lightBlue : Colors.indigo[800];
    Color tcolor = data['isDT'] ? Colors.black : Colors.white;

    return Scaffold(
        backgroundColor: color,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  FlatButton.icon(
                    label: Text(
                        'Edit location',
                        style: TextStyle(
                          fontSize: 20.0,
                          letterSpacing: 1.5,
                          color: tcolor,
                        ),
                    ),
                    onPressed: () async {
                        dynamic result = await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data = {
                            'time' : result['time'],
                            'flag' : result['flag'],
                            'location' : result['location'],
                            'isDT' : result['isDT'],
                          };
                        });
                    },
                    icon: Icon(
                      Icons.location_on,
                      color: tcolor,
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                          data['location'],
                          style: TextStyle(
                            fontSize: 30.0,
                            letterSpacing: 2.0,
                            color: tcolor,
                          ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 60.0,
                      letterSpacing: 2.0,
                      color: tcolor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}