import 'package:flutter/material.dart';
import './ui/WeatherReport.dart';

void main() {
    runApp(
        new MaterialApp(
          title: 'WheatherReport',
          debugShowCheckedModeBanner: false,
          home: new WeatherReport(),
        )
    );
}