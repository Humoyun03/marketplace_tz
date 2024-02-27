import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../main/main_page.dart';

class LocationDetailScreen extends StatefulWidget {
  const LocationDetailScreen({super.key});

  @override
  State<LocationDetailScreen> createState() => _LocationDetailScreenState();
}

class _LocationDetailScreenState extends State<LocationDetailScreen> {
  TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05,
                  left: 20,
                  right: 20),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Center(
                    child: Text(
                      "Manzil ma'lumotlari",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Spacer()
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 28.0, left: 20),
              child: Row(
                children: [
                  Text(
                    "Manzil nomi",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    "*",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: TextField(
                controller: controller,
                onChanged: (text){
                  controller.text=text;
                },
                decoration: const InputDecoration(
                    hintText: "Kiriting",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder()),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 28.0, left: 20),
              child: Row(
                children: [
                  Text(
                    "Manzil",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    "*",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Yangi choshtepa,O'zar 76",
                    suffixIcon: Image.asset(
                      "assets/images/btn.png",
                      height: 10,
                      width: 10,
                    ),
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder()),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20),
                child: Text(
                  "Qo'shimcha ma'lumotlar",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 28.0, left: 20),
              child: Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Bino yoki ofis",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w800),
                          ),
                          Text(
                            "*",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      //  Padding(
                      //   padding: EdgeInsets.only( right: 20),
                      //   child: TextField(
                      //     decoration: InputDecoration(
                      //         hintText: "Kiriting",
                      //         hintStyle: TextStyle(color: Colors.grey),
                      //         border: OutlineInputBorder()),
                      //   ),
                      // ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 58.0),
                    child: Row(
                      children: [
                        Text(
                          "Qavat",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "*",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 28.0, left: 20),
              child: Row(
                children: [
                  Text(
                    "Domofon kodi",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    "*",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Kiriting",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder()),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 28.0, left: 20),
              child: Row(
                children: [
                  Text(
                    "Kuryer uchun izoh",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    "*",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Kiriting",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Padding(
                padding: EdgeInsets.only(top: 80),
                child: InkWell(
                  onTap: (){
                    // Navigator.pushNamed(context, "main");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainPage(street:controller.text ,),
                      ),
                    );
                  },
                  child: Container(
                    height: 56,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: const Center(
                      child: Text(
                        "Saqlash",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
