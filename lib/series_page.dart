import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movie_db_app/basic_page.dart';
import 'package:movie_db_app/bloc/series_bloc.dart';
import 'package:movie_db_app/content_item.dart';
import 'package:movie_db_app/series_detail_page.dart';
import 'package:supercharged/supercharged.dart';

class SeriesPage extends StatefulWidget {
  @override
  _SeriesPageState createState() => _SeriesPageState();
}

class _SeriesPageState extends State<SeriesPage> {
  @override
  Widget build(BuildContext context) {
    context.read<SeriesBloc>().add(GetSeries());
    return Scaffold(
      body: BasicPage(
          header: "Series ",
          subheader: "Series List",
          backColor: "e7e7e8".toColor(),
          child: SizedBox(
            height: (MediaQuery.of(context).size.height) - 210,
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: BlocBuilder<SeriesBloc, SeriesState>(
                builder: (_, state) => (state is SeriesLoaded)
                    ? GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        childAspectRatio:
                            (MediaQuery.of(context).size.width / 2 - 20) / 210,
                        children: state.serieses
                            .map((e) => GestureDetector(
                                  onTap: () {
                                    Get.to(SeriesDetailPage(e));
                                  },
                                  child: ContentItem(
                                    imageUrl: e.posterPath,
                                    title: e.originalName,
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
