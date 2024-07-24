import 'package:flutter/foundation.dart';

class ApiConst{
  static const String _defaltEndpoint = "https://spotify23.p.rapidapi.com/";
  static const String _devEndpoint = _defaltEndpoint;
  static const String _prodEndpoint = _defaltEndpoint;
  static const String _endPoint = kReleaseMode ? _prodEndpoint : _devEndpoint;

  //end point
  // static const String logInUrl = "$_endPoint/login/";
  // static const String signUpUrl = "$_endPoint/signup/";
  static const String albums = "$_endPoint/albums";
  static const String track = "$_endPoint/tracks";
}