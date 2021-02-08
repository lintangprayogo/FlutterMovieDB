import 'package:flutter/material.dart';
import 'package:movie_db_app/video_item.dart';

class MovieDetailPage extends StatefulWidget {
  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  Widget build(BuildContext context) {
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
          child: ListView(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                          child: Image.asset("assets/back_arrow.png"),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 62,
                        child: Center(
                          child: Text(
                            "Wonder Woman 1984",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.black, fontSize: 20),
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/w500/srYya1ZlI97Au4jUYAktDe3avyA.jpg"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                        width: 100,
                        height: 120,
                        margin: EdgeInsets.only(left: 24, top: 140),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 4),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://image.tmdb.org/t/p/w300/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg"),
                              fit: BoxFit.cover),
                        )),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 24, top: 10),
                  child: Text(
                    "Wonder Woman 1984",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 24),
                  child: Text(
                    "Realese Date: 2020-12-16",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 24, top: 10),
                  child: Text(
                    "Overview",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 24),
                  child: Text(
                    "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s and finds a formidable foe by the name of the Cheetah.",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 24, top: 10),
                  child: Text(
                    "Video",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(right: 24),
                  height: 140,
                  child: ListView(
                     scrollDirection: Axis.horizontal,
                    children: [VideoItem(), VideoItem(), VideoItem()],
                  ),
                )
              ],
            ),
          ]),
        )
      ],
    ));
  }
}
