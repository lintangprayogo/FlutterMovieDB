import 'package:flutter/material.dart';

class VideoItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Container(
              width: 120,
              height: 100,
              margin: EdgeInsets.only(left: 24),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://img.youtube.com/vi/sfM7_JLk-84/0.jpg"))),
            ),
            Text(
              "Official Trailer",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            )
          ],
        ),
      ],
    );
  }
}
