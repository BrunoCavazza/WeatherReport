import 'package:flutter/material.dart';

class WeatherReport extends StatefulWidget {
  @override
  _WeatherReportState createState() => _WeatherReportState();
}

class _WeatherReportState extends State<WeatherReport> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Weather Report'),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.menu,),
              onPressed: ()=> debugPrint("Hola Mundo"))
        ],
      ),
      body: new Stack(
        children: <Widget>[
          new Center(
            child: new Image.asset('images/4.gif',
            height: 1200,
            width: 500,
            fit: BoxFit.fill,
            ),
          )
          new Container(
            child: new Text('Cordoba'),
          )
        ],
      ),
    );
  }
}
