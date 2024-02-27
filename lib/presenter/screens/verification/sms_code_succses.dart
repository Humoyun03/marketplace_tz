import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SMSSucssesPage extends StatefulWidget {
  String phoneNumber;

  SMSSucssesPage({required this.phoneNumber});

  @override
  State<SMSSucssesPage> createState() => _SMSSucssesPageState();
}

class _SMSSucssesPageState extends State<SMSSucssesPage> {
  TextEditingController controler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 30),
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff636C79)),
                    child: Center(
                        child: Icon(Icons.keyboard_arrow_left_outlined,
                            color: Colors.white)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.asset(
                          "assets/images/app_image.png",
                          height: 64,
                          width: 64,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, top: 30),
                          child: Text(
                            "Tasdiqlash kodi",
                            style: GoogleFonts.montserrat(
                                fontSize: 28, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, top: 16),
                          child: Text(
                            "Quyidagi telefon raqamiga sms-kod yuborildi!",
                            style: GoogleFonts.montserrat(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, top: 16),
                          child: Text(
                            widget.phoneNumber,
                            style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      controller: controler,
                      maxLength: 4,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(14),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffF1F2F4), // Border rangi
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(14),
                          ),
                        ),
                      ),
                      onChanged: (satr) {
                        setState(() {});
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      height: 40,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadiusDirectional.circular(14)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "00:17",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(14)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/update.png"),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Kodni qayta yuboring",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      if (controler.text.length == 4) {
                        Navigator.pushNamed(context, "mapScreen"
                        );
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: controler.text.length == 4
                              ? Colors.blue
                              : Colors.black12,
                          borderRadius: BorderRadiusDirectional.circular(30)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Tasdiqlash",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffF1F2F4)),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 90),
                    child: Row(
                      children: [
                        Text(
                          "Mobil ilovadan ro‘yxatdan o‘tish orqali, siz  ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          "Foydalanuvchi kelishuvi",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 10, color: Colors.blue),
                        ),
                        Text(
                          "va",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 10, color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Maxfiylik siyosati ",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 10, color: Colors.blue),
                        ),
                        Text(
                          "shartlariga rozi ekanligingizni tasdiqlaysiz.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
