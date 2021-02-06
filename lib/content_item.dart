import 'dart:ui';

import 'package:flutter/material.dart';

class SeriesItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String year;
  SeriesItem({this.imageUrl,this.title,this.year});

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
                  image: AssetImage(imageUrl), fit: BoxFit.fill),
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
                          Text('75%',
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
