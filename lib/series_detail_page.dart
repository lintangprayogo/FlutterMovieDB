import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movie_db_app/bloc/video_bloc.dart';
import 'package:movie_db_app/model/models.dart';
import 'package:movie_db_app/video_item.dart';
import 'package:url_launcher/url_launcher.dart';

class SeriesDetailPage extends StatefulWidget {
  final SeriesData series;
  SeriesDetailPage(this.series);
  @override
  _SeriesDetailPageState createState() => _SeriesDetailPageState();
}

class _SeriesDetailPageState extends State<SeriesDetailPage> {
  Widget build(BuildContext context) {
    context.read<VideoMovieBloc>().add(GetVideo("tv", widget.series.id));
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: Colors.white70,
        ),
        SafeArea(
            child: Container(
          color: Colors.white,
        )),
        SafeArea(
          child: Column(
            children: [
              Container(
                height: 50,
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 24,
                        height: 24,
                        child: GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Image.asset("assets/back_arrow.png")),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 62,
                      child: Center(
                        child: Text(
                          "${widget.series.originalName}",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.black, fontSize: 20),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height - 100,
                child: ListView(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: "${widget.series.backdropPath}",
                            imageBuilder: (context, imageProvider) => Container(
                              height: 200,
                              width: (MediaQuery.of(context).size.width),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            placeholder: (context, url) => Container(
                              color: Colors.white,
                              width: (MediaQuery.of(context).size.width),
                              height: 200,
                              child: Icon(
                                Icons.image,
                                size: 64,
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              color: Colors.white,
                              width: (MediaQuery.of(context).size.width),
                              height: 200,
                              child: Icon(
                                Icons.error,
                                size: 64,
                              ),
                            ),
                          ),
                          CachedNetworkImage(
                            imageUrl: "${widget.series.posterPath}",
                            imageBuilder: (context, imageProvider) => Container(
                              width: 100,
                              height: 120,
                              margin: EdgeInsets.only(left: 24, top: 140),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            placeholder: (context, url) => Container(
                              color: Colors.white,
                              width: 100,
                              height: 120,
                              child: Icon(
                                Icons.image,
                                size: 64,
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              color: Colors.white,
                              width: 100,
                              height: 120,
                              child: Icon(
                                Icons.error,
                                size: 64,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 24, top: 10),
                        child: Text(
                          "${widget.series.originalName}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 24),
                        child: Text(
                          "First Air Date: ${widget.series.airDate}",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 24),
                        child: Text(
                          "Score: ${widget.series.vote.toInt()} %",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 24, top: 10),
                        child: Text(
                          "Overview",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 24, right: 24),
                        child: Text(
                          "${widget.series.overview}",
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 24, top: 10),
                        child: Text(
                          "Video",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(left: 24, right: 24),
                          height: 140,
                          child: BlocBuilder<VideoMovieBloc, VideoState>(
                              builder: (_, state) => (state is VideoLoaded)
                                  ? ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: state.videos
                                          .map((e) => GestureDetector(
                                                child: (state.videos[0] == e)
                                                    ? VideoItem(
                                                        videoData: e,
                                                        marginLeft: 0)
                                                    : VideoItem(
                                                        videoData: e,
                                                        marginLeft: 24),
                                                onTap: () async {
                                                  launch(
                                                      "https://www.youtube.com/watch?v=${e.key}");
                                                },
                                              ))
                                          .toList(),
                                    )
                                  : Center(child: Text("Loading..."))))
                    ],
                  ),
                ]),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
