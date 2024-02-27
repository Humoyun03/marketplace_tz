

import 'package:flutter/cupertino.dart';

Widget categoryItem(String name, String image, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 7, top: 7, right: 7, bottom: 7),
    child: Container(
        height: 120,
        width: MediaQuery.sizeOf(context).width/3.4,
        decoration: BoxDecoration(
          color: Color(0xDBE0F9FF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top:8.0, left: 8),
                child: Text(name,style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500
                ),),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only( right: 8),
                child: Image.asset(
                  image,
                  height:55 ,
                ),
              ),
            ),
          ],

        )),
  );
}

Widget categoryItemLong(String name, String image, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 7, top: 7, right: 7, bottom: 7),
    child: Container(
        height: 120,
        width: MediaQuery.sizeOf(context).width/1.6,
        decoration: BoxDecoration(
          color: Color(0xDBE0F9FF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top:8.0, left: 8),
                child: Text(name,style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500
                ),),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only( right: 12),
                child: Image.asset(
                  image,
                  height:90 ,
                ),
              ),
            ),
          ],

        )),
  );
}