import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movie_db_app/basic_page.dart';
import 'package:movie_db_app/bloc/movie_bloc.dart';
import 'package:movie_db_app/content_item.dart';
import 'package:movie_db_app/movie_detail_page.dart';
import 'package:supercharged/supercharged.dart';

class MoviePage extends StatefulWidget {
  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    context.read<MovieBloc>().add(GetMovie());
    return Scaffold(
      body: BasicPage(
          header: "Movie ",
          subheader: "Movie List",
          backColor: "e7e7e8".toColor(),
          child: SizedBox(
            height: (MediaQuery.of(context).size.height) - 210,
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: BlocBuilder<MovieBloc, MovieState>(
                builder: (_, state) => (state is MovieLoaded)
                    ? GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        childAspectRatio:
                            (MediaQuery.of(context).size.width / 2 - 20) / 210,
                        children: state.movies
                            .map((e) => GestureDetector(
                                  onTap: () {
                                    Get.to(MovieDetailPage(e));
                                  },
                                  child: ContentItem(
                                    imageUrl: e.posterPath,
                                    title: e.originalTitle,
                                    year: e.year,
                                    vote: e.vote,
                                  ),
                                ))
                            .toList(),
                      )
                    : Center(child: Text("Loading ....")),
              ),
            ),
          )),
    );
  }
}
