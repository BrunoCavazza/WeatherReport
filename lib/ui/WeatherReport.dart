import 'dart:async';
import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../utill/utils.dart' as util;

class WeatherReport extends StatefulWidget {
  @override
  _WeatherReportState createState() => _WeatherReportState();
}

class _WeatherReportState extends State<WeatherReport> {

  String temperatura = null;
  String maxima = null;
  String minima = null;
  String humedad = null;

  void showStuff() async {
    Map data =  await getWeather(util.appId, util.defaultCity);
        print(data.toString());
  }

  void initState(){
    super.initState();
    this.showStuff();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Weather Report'),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.refresh,),
              onPressed: showStuff)
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
          ),
          new Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.fromLTRB(0, 11, 20, 0),
            child: new Text('Cordoba',
            style: cityStyle(),),
          ),

          //Fetchs del Clima
          new Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 400),
            alignment: Alignment.center,
              child: new Text('$temperatura°', style: tempStyle()),
          ),
          new Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 500),
            alignment: Alignment.center,
            child: new Text('Temperatura', style: bottomStyle()),
          ),

          new Container(
            margin: const EdgeInsets.fromLTRB(0, 550, 240, 0),
            alignment: Alignment.center,
            child: new Text('$maxima°', style: bottomStyle()),
          ),
          new Container(
            margin: const EdgeInsets.fromLTRB(240, 550, 0, 0),
            alignment: Alignment.center,
            child: new Text('$temperatura°', style: bottomStyle()),
          ),
          new Container(
            margin: const EdgeInsets.fromLTRB(0, 550, 0, 0),
            alignment: Alignment.center,
            child: new Text('$humedad%', style: bottomStyle()),
          ),
          new Container(
            margin: const EdgeInsets.fromLTRB(0, 480, 0, 0),
            alignment: Alignment.center,
            child: new Text('Hum', style: bottomStyle()),
          ),
          new Container(
            margin: const EdgeInsets.fromLTRB(0, 480, 240, 0),
            alignment: Alignment.center,
            child: new Text('Max', style: bottomStyle()),
          ),
          new Container(
            margin: const EdgeInsets.fromLTRB(240, 480, 0, 0),
            alignment: Alignment.center,
            child: new Text('Min', style: bottomStyle()),
          ),
        ],
      ),
    );
  }

  Future<Map> getWeather(String appId, String city)  async {
    String apiUrl = 'http://api.openweathermap.org/data/2.5/weather?id=$city&APPID=' '${util.appId}&units=metric';

    http.Response response = await http.get(
        Uri.encodeFull(apiUrl),
        headers: {"Accept": "application/json"}
    );

    setState(() {
      var decodeJson = jsonDecode(response.body);
      temperatura = decodeJson['object']['main']['temp'].toString();
      maxima = decodeJson['object']['main']['temp_max'].toString();
      minima = decodeJson['object']['main']['temp_min'].toString();
      humedad = decodeJson['object']['main']['humidity'].toString();
    });

    return jsonDecode(response.body);
  }


}




TextStyle cityStyle() {
    return new TextStyle(
        color: Colors.black,
        fontSize: 23,
        fontStyle: FontStyle.italic
    );
}
TextStyle tempStyle() {
    return new TextStyle(
        color: Colors.black,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      fontSize: 49.9
    );
}
TextStyle bottomStyle() {
  return new TextStyle(
      color: Colors.black,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      fontSize: 35
  );
}