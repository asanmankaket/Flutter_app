import 'package:flutter/material.dart';
import 'package:flutter_appcare/views/Register.dart';
import 'package:flutter_appcare/views/booking.dart';
import 'package:flutter_appcare/views/page1.dart';
import 'package:flutter_appcare/views/Map.dart';
import 'package:flutter_appcare/views/profile.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/PageOne': (context) => PageOne(),
  '/Page1': (context) => Page1(),
  '/Map': (context) => GoogleMaps(),
  '/book': (context) => Booking(),
  '/Profile': (context) => Profiles(),
};
