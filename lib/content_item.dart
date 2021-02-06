import 'dart:ui';

import 'package:flutter/material.dart';

class ContentItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String year;
  final double vote;
  ContentItem({this.imageUrl, this.title, this.year,this.vote});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width / 2),
      height: 210,
      child: Column(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              image: DecorationImage(
                  image: NetworkImage(imageUrl), fit: BoxFit.fill),
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
                          style: TextStyle(
                              fontSize: 12, color: Colors.green[200])),
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
      ),
    );
  }
}
