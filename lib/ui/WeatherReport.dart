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

  void showStuff() async {
    Map data =  await getWeather(util.appId, util.defaultCity);
        print(data.toString());
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
              icon: new Icon(Icons.menu,),
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
          new Container(
            alignment: Alignment.center,
            child: new Image.asset('images/7.gif',
              height: 1200,
              width: 500,
              fit: BoxFit.fill,
            ),
          ),

          //Fetch del Clima
          new Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 400),
            alignment: Alignment.center, child: new Text('32*', style: tempStyle())
          ),
        ],
      ),
    );
  }

  Future<Map> getWeather(String appId, String city)  async {
    String apiUrl = 'http://api.openweathermap.org/data/2.5/forecast?id=$city&APPID=' '${util.appId}&units=metric';

    http.Response response = await http.get(apiUrl);

    return json.decode(response.body);
  }

}




TextStyle cityStyle() {
    return new TextStyle(
        color: Colors.deepPurpleAccent,
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