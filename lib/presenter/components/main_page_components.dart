import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget InputText(String label, TextInputType type,
    TextEditingController controller, int length, void Function(String)? onChanged, String image) {
  return Container(
    child: Theme(
      data: ThemeData(
        primaryColor: Colors.greenAccent,
        primaryColorDark: Colors.green,
      ),
      child: TextField(
        onChanged: onChanged,
        maxLength: length,
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFF8F8F8),
          counterText: "",
          prefixIcon: Icon(CupertinoIcons.search),
          hintText: label,
          hintStyle: TextStyle(color: Color(0xFFC0BFBF)),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            borderSide: BorderSide(color: Color(0xFFF1F1F1)), // Set border color same as background color
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            borderSide: BorderSide.none, // Remove border
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              print("CLICK");
              controller.clear();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Image.asset(image, color: Colors.black,),
            ),
          ),
        ),
      ),
    ),
  );
}


Widget categoryItem2(String name, String img, void Function() ontap) {
  return Padding(
    padding: const EdgeInsets.only(left: 16, top: 4),
    child: Column(
      children: [
        InkWell(
          onTap: (){
            ontap;
          },
          child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x34000000),
                    offset: Offset(
                      0.5,
                      0.5,
                    ),
                    blurRadius: 0.1,
                    spreadRadius: 0.3,
                  ), //BoxShadow
                  BoxShadow(
                    color: Color(0x34000000),
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                ],
              ),
              child: Align(
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Image.asset(
                        img,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ]
                  )
              )
          ),
        ),
        Container(
          width: 80,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 10
                )),
          ),
        )
      ],
    ),
  );
}

Widget productItem2(String name, String img, String value, String price) {
  return Padding(
    padding: const EdgeInsets.only(left: 16, top: 8),
    child: Container(
      width: 140,
      height: 293,
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Stack(
            children :[
             Container(
              width: 140,
              height: 160,
              child: Align(
              alignment: Alignment.center,
              child: Container(
                  height: 140,
                  width: 120,
                  decoration:BoxDecoration(
                    color:Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(img, height: 80,),
                  )
              )
          )),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.favorite_outline_rounded,)),
              )
      ]
          ),

          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: SizedBox(
              width: 140,
              child: Text(
                  "${price} so`m",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 22
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Container(
              width: 140,
              child: Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Container(
              width: 140,
              child: Text(
                  "${value} L",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 140,
              height: 35,
              decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 2.0, left: 5.0, bottom: 2.0, right: 3),
                child: Row(
                  children: [
                    Image.asset("assets/images/basket.png", height: 20,),
                    SizedBox(width: 3,),
                    const Text(
                        "Savatga qo`shish",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 11
                        )),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    ),
  );
}

Widget mainComponent(BuildContext context){
  return Container(
    height: 150,
    width: MediaQuery.sizeOf(context).width - 30,
    decoration: BoxDecoration(
      color: Color(0xFF0CC7B4),
      borderRadius: BorderRadius.circular(15),
    ),

    child:  Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 18.0, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Eng sifatli mevalar", style:
              TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),),
              SizedBox(height: 10,),
              Text("Ta`tib ko`rishni istaysizmi?", style:
              TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400),),
              SizedBox(height: 50,),
              Container(
                width: 190,
                height: 40,
                decoration: BoxDecoration(
                    color: const Color(0xFFE5AF08),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: const Padding(
                  padding: EdgeInsets.only(top: 2.0, left: 5.0, bottom: 2.0, right: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.delivery_dining),
                      SizedBox(width: 3,),
                      Text(
                          "Yetqazib berish tekin",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        Align(
            alignment: Alignment.bottomRight,
            child: Image.asset("assets/images/comp.png", ))
      ],
    ),
  );
}
