import 'package:flutter/material.dart';
import 'package:movie_db_app/basic_page.dart';
import 'package:movie_db_app/content_item.dart';
import 'package:supercharged/supercharged.dart';

class TelevisionPage extends StatefulWidget {
  @override
  _TelevisionPageState createState() => _TelevisionPageState();
}

class _TelevisionPageState extends State<TelevisionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BasicPage(
          header: "Series",
          subheader: "Series List",
          backColor: "e7e7e8".toColor(),
          child: SizedBox(
            height: (MediaQuery.of(context).size.height) - 210,
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio:
                    (MediaQuery.of(context).size.width / 2 - 20) / 210,
                children: List.generate(10, (index) {
                  return SeriesItem(
                    imageUrl: "assets/flash.jpg",
                    title: "THE FLASH",
                    year: "2017",
                  );
                }),
              ),
            ),
          )),
    );
  }
}
