import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'package:movie_db_app/model/models.dart';

part 'movie_service.dart';
part 'series_service.dart';


String baseURL = "https://api.themoviedb.org/3/";
String apiKey = "2889b7616574dc7355a328ebf5cde7e3";
