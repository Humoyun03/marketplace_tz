import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';

import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../domain/repository/repository.dart';

class MapScreenLocation extends StatefulWidget {
  const MapScreenLocation({super.key});

  @override
  State<MapScreenLocation> createState() => _MapScreenLocationState();
}

class _MapScreenLocationState extends State<MapScreenLocation> {
  final mapControllerCompleter = Completer<YandexMapController>();
  final mapGetxController = AppRepository();
  final List<MapObject> mapObjects = [];
  double lat = 0;
  double long = 0;
  var name = "";
  bool isTap = false;

  // void getBranches() async {
  //   final result = await ApiService().getBranches();
  //
  //   for (var element in result.data.data[0].openedStores) {
  //     print(element.name);
  //     //print();
  //     mapObjects.add(PlacemarkMapObject(
  //         mapId: MapObjectId(element.id.toString()),
  //         icon: PlacemarkIcon.single(PlacemarkIconStyle(
  //             scale: 0.8,
  //             image: BitmapDescriptor.fromAssetImage('assets/btn2.bmp'))),
  //         point: Point(
  //             latitude: double.parse(element.lat),
  //             longitude: double.parse(element.long))));
  //   }
  //   // _moveToCurrentLocation(double.parse(result.data.data.first.openedStores.first.lat), double.parse(result.data.data.first.openedStores.first.long));
  //   /*setState(() {
  //
  //   });*/
  // }

  void getFriends() async {
    final repository = AppRepository();
    var resualt = await repository.getFriendLocation();
    print("${resualt.length}");
    for (var friend in resualt) {
      mapObjects.add(PlacemarkMapObject(
          text: PlacemarkText(
            text: friend.name ?? "null",
            style: const PlacemarkTextStyle(
                size: 10, placement: TextStylePlacement.bottom),
          ),
          mapId: MapObjectId(friend.mapId.toString()),
          icon: PlacemarkIcon.single(PlacemarkIconStyle(
              scale: 0.1,
              image: BitmapDescriptor.fromAssetImage('assets/images/btn.png'))),
          point:
              Point(latitude: friend.late ?? 0, longitude: friend.long ?? 0)));
      setState(() {});
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    getFriends();
    super.initState();
  }
  List<Placemark> placeMarks=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      YandexMap(
          onMapCreated: (controller) {
            mapControllerCompleter.complete(controller);
          },
          onMapTap: (point) async {
            isTap = true;
            print('LAT ----------------------');
            lat = point.latitude;
            long = point.longitude;
            // placeMarks.first.
            print(point.latitude);
            setState(() {});
          },
          onObjectTap: (geoObject) async {
            print("NAMEEE${geoObject.name}");
            placeMarks = await placemarkFromCoordinates(lat, long);

            name = placeMarks.first.name!;
            print(geoObject.name);
            setState(() {});
          },
          zoomGesturesEnabled: true,
          mapObjects:
              mapObjects /*[
            PlacemarkMapObject(
              onTap: (object, point) {
                print('Object tappeppp');
                print(object.mapId.value);
              },
              text: PlacemarkText(
                  text: "BUTTON", style: PlacemarkTextStyle(size: 12,placement: TextStylePlacement.bottom)),
              mapId: MapObjectId('154'),
              icon: PlacemarkIcon.single(PlacemarkIconStyle(
                  scale: 0.8,
                  image: BitmapDescriptor.fromAssetImage('assets/btn.png'))),
              point: Point(latitude: 41.311081, longitude: 69.240562))

          ],*/
          ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
          child: Container(
            height: 56,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 18.0),
                  child: Icon(Icons.search),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Manzilni izlash",
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      if (isTap)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
            child: Container(
              height: 56,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 18.0),
                      child: Text(
                        "Manzilingiz:",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text(
                          "$name",
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 9 / 10),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, "mapdetailScreen");
            },
            child: Container(
              height: 56,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: const Center(
                  child: Text(
                "Davom etish",
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),
        ),
      )
    ]));
  }
}
