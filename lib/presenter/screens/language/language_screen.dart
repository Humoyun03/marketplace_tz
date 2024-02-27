import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../utils/app_lat_long.dart';
import '../../../utils/location_service.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  AppLatLong? location;

  Future<void> _initPermission() async {
    if (!await LocationService().checkPermission()) {
      await LocationService().requestPermission();
    }
    await fetchCurrentLocation();
  }

  Future<void> fetchCurrentLocation() async {
    const defLocation = MoscowLocation();
    try {
      location = await LocationService().getCurrentLocation();
    } catch (_) {
      location = defLocation;
    }
    // _moveToCurrentLocation(location.lat,location.long);
  }

  bool isSelect = false;

  @override
  Widget build(BuildContext context) {
    _initPermission();
    fetchCurrentLocation();
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 2 / 15),
              child: Text(
                "Tilni tanlang",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              "Qaysi til orqali dastur interfeysidan foydalanmoqchisiz?",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 78.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xFFF7F7F8),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    height: 50,
                    width: double.infinity,
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 18.0),
                          child: Text("O'zbek"),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child:
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blue, width: 5),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(50),
                                    )),
                              ),
                          //     Checkbox(
                          //   focusColor: Colors.blue,
                          //   activeColor: Colors.blue,
                          //   hoverColor: Colors.blue,
                          //   shape: RoundedRectangleBorder(
                          //     side: BorderSide(width: 5.0, color: Colors.blue),
                          //     // Kenar çizgisi
                          //     borderRadius:
                          //         BorderRadius.circular(4.0), // Köşe yarıçapı
                          //   ),
                          //   value: isSelect,
                          //   onChanged: (bool? value) {
                          //     isSelect = !isSelect;
                          //     setState(() {});
                          //   },
                          // ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xFFF7F7F8),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    height: 50,
                    width: double.infinity,
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 18.0),
                          child: Text("Русский язык"),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.blue, width: 5),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(50),
                                )),
                          ),
                        ),
                        // Checkbox(
                        //   focusColor: Colors.blue,
                        //   activeColor: Colors.blue,
                        //   hoverColor: Colors.blue,
                        //   shape: RoundedRectangleBorder(
                        //     side: BorderSide(width: 5.0, color: Colors.blue),
                        //     // Kenar çizgisi
                        //     borderRadius:
                        //     BorderRadius.circular(4.0), // Köşe yarıçapı
                        //   ),
                        //   value: isSelect,
                        //   onChanged: (bool? value) {
                        //     isSelect = !isSelect;
                        //     setState(() {});
                        //   },
                        // ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xFFF7F7F8),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    height: 50,
                    width: double.infinity,
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 18.0),
                          child: Text("English language"),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.blue, width: 5),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(50),
                                )),
                          ),
                        ),
                        // Checkbox(
                        //   focusColor: Colors.blue,
                        //   activeColor: Colors.blue,
                        //   hoverColor: Colors.blue,
                        //   shape: RoundedRectangleBorder(
                        //     side: BorderSide(width: 5.0, color: Colors.blue),
                        //     // Kenar çizgisi
                        //     borderRadius:
                        //     BorderRadius.circular(4.0), // Köşe yarıçapı
                        //   ),
                        //   value: isSelect,
                        //   onChanged: (bool? value) {
                        //     isSelect = !isSelect;
                        //     setState(() {});
                        //   },
                        // ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 3 / 9),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "register");
                      },
                      child: Container(
                        height: 56,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: Center(
                            child: Text(
                          "Keyingi",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
