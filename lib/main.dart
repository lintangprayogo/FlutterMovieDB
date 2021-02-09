import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movie_db_app/bloc/movie_bloc.dart';
import 'package:movie_db_app/bloc/series_bloc.dart';
import 'package:movie_db_app/main_page.dart';

import 'bloc/video_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => SeriesBloc()),
          BlocProvider(create: (_) => MovieBloc()),
          BlocProvider(create: (_) => VideoMovieBloc()),
        ],
        child: MaterialApp(
          home: MainPage(),
          debugShowCheckedModeBanner: false,
          navigatorKey: Get.key,
        ));
  }
}
