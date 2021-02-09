import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_db_app/model/models.dart';

class VideoItem extends StatelessWidget {
  final VideoData videoData;
  final double marginLeft;
  VideoItem({this.videoData, this.marginLeft});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: 120,
                height: 100,
                margin: EdgeInsets.only(left: marginLeft),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: "https://img.youtube.com/vi/${videoData.key}/0.jpg",
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Icon(
                    Icons.image,
                    size: 32,
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )
                ),
            Container(
              width: 120,
              margin: EdgeInsets.only(left: marginLeft),
              child: Text(
                "${videoData.name}",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            )
          ],
        ),
      ],
    );
  }
}
