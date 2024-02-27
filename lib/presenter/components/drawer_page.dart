import 'package:flutter/material.dart';

class DrawerExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TestScreen(),
    );
  }
}

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 36,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(36),
                      child: Image.asset(
                        'assets/img.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(width: 18,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Salom 👋',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'Xurshid',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  )
                ],
              ),

              Column(
                children: [
                  ListTile(
                    title: Text('Keshbek',style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),),
                    leading: Icon(Icons.wallet,color: Colors.blueAccent,),
                    trailing: Text('0.0 so`m',style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                  ListTile(
                    title: Text('Shaxsiy ma`lumotlar',style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),),
                    leading: Icon(Icons.person,color: Colors.blueAccent,),
                    trailing: Icon(Icons.arrow_circle_right),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                  ListTile(
                    title: Text('Mening kartalarim',style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),),
                    leading: Icon(Icons.credit_card_sharp,color: Colors.blueAccent,),
                    trailing: Icon(Icons.arrow_circle_right),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                  ListTile(
                    title: Text('Manzillar',style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),),
                    leading: Icon(Icons.location_on,color: Colors.blueAccent,),
                    trailing: Icon(Icons.arrow_circle_right),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                  ListTile(
                    title: Text('Xavfsizlik',style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),),
                    leading: Icon(Icons.privacy_tip,color: Colors.blueAccent,),
                    trailing: Text('O`chiq',style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                  ListTile(
                    title: Text('Sozlamalar',style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),),
                    leading: Icon(Icons.settings,color: Colors.blueAccent,),
                    trailing: Icon(Icons.arrow_circle_right),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                  ListTile(
                    title: Text('Biz haqimizda',style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),),
                    leading: Icon(Icons.info,color: Colors.blueAccent,),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                  ListTile(
                    title: Text('Keshbek',style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),),
                    leading: Icon(Icons.live_help,color: Colors.blueAccent,),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                  ListTile(
                    title: Text('Ulashish',style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),),
                    leading: Icon(Icons.share,color: Colors.blueAccent,),

                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                  ListTile(
                    title: Text('Chiqish',style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.redAccent
                    ),),
                    leading: Icon(Icons.logout_sharp,color: Colors.redAccent,),
                  ),

                ],
              ),

              Text('Versiya 1.1.0',style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w400
              ),)
            ],
          ),
        ),
      ),
      body: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
