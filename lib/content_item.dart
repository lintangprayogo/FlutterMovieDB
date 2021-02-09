import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ContentItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String year;
  final double vote;
  ContentItem({this.imageUrl, this.title, this.year, this.vote});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: imageUrl,
          imageBuilder: (context, imageProvider) => Container(
            height: 150,
            width: (MediaQuery.of(context).size.width / 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          placeholder: (context, url) => Container(
            color: Colors.white,
            width: (MediaQuery.of(context).size.width / 2),
            height: 150,
            child: Icon(
              Icons.image,
              size: 32,
            ),
          ),
          errorWidget: (context, url, error) => Container(
            color: Colors.white,
            width: (MediaQuery.of(context).size.width / 2),
            height: 150,
            child: Icon(
              Icons.error,
              size: 32,
            ),
          ),
        ),
        Container(
          height: 50,
          padding: EdgeInsets.all(5),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 14),
                maxLines: 1,
              ),
              Container(
                margin: EdgeInsets.only(top: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(year,
                        style:
                            TextStyle(fontSize: 12, color: Colors.green[200])),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.green[300],
                          size: 12,
                        ),
                        Text('${vote.toInt()} %',
                            style: TextStyle(
                                fontSize: 12, color: Colors.green[300])),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
