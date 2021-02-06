
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int idx) onSelected;

  CustomBottomNavBar({this.selectedIndex = 0, this.onSelected});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              if (onSelected != null) {
                onSelected(0);
              }
            },
            child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/movie" +
                          (selectedIndex == 0 ? "_selected.png" : ".png")),
                      fit: BoxFit.cover),
                )),
          ),
          GestureDetector(
            onTap: () {
              if (onSelected != null) {
                onSelected(1);
              }
            },
            child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/tv" +
                          (selectedIndex == 1 ? "_selected.png" : ".png")),
                      fit: BoxFit.cover),
                )),
          ),
         
        
        ],
      ),
    );
  }
}
