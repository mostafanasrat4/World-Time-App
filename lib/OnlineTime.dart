import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'main.dart';
import 'package:http/http.dart';

class OnlineTime {
  String? Time;
  String? Location;
  String? URL;
  OnlineTime({this.Location, this.URL});

  Future<void> getTime() async{
    Response response = await get(Uri.parse('https://timeapi.io/api/Time/current/zone?timeZone=$URL'));

    Map data = jsonDecode(response.body);

    DateTime currentTime = DateTime.parse(data['dateTime']);

    Time = DateFormat.jm().format(currentTime);
  }

}