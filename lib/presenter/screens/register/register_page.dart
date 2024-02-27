import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}



class _RegisterPageState extends State<RegisterPage> {
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
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 30),
                    child: Text(
                      "Kirish yoki Ro‘yxatdan o‘tish",
                      style: GoogleFonts.montserrat(
                          fontSize: 28, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 30),
                        child: Text(
                          "Telefon raqamingizni kiriting",
                          style: GoogleFonts.montserrat(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Text(
                          "*",
                          style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color: Colors.red,
                              fontWeight: FontWeight.w600),
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
                      maxLength: 9,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        prefix: Text("+998"),
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
                      onChanged: (satr){
                        setState(() {});
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: (){
                      if(controler.text.length == 9){
                        Navigator.pushNamed(context, "smsveri");
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: controler.text.length == 9 ? Colors.blue: Color(0xff99A0A8),
                          borderRadius: BorderRadiusDirectional.circular(30)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Kodni yuborish",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffF1F2F4)
                            ),
                          )
                        ],
                      ),
                    ),
                  ),



                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16,top: 200),
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
