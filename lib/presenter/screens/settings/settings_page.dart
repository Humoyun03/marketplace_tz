import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Sozlamalar',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Image.asset('assets/images/arrowback.png')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ItemSettings(
                'assets/images/language.png',
                Text(
                  'Ilova tili',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                Text(
                  'O`zbek',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                )),
            ItemSettings(
                'assets/images/sun.png',
                Text(
                  'Mavzu',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Kunduzgi',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                )),
            ItemSettings(
                'assets/images/notification.png',
                Text(
                  'Bildirishnomalar',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                SwitchExample()),
          ],
        ),
      ),
    );
  }
}

Widget ItemSettings(String assetsName, Widget title, Widget trailing) {
  return Column(
    children: [
      ListTile(
        leading: Image.asset(assetsName),
        title: title,
        trailing: trailing,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Divider(
          height: 1,
          color: Colors.grey,
        ),
      ),
    ],
  );
}

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 55,
      height: 40,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Switch(
          activeColor: Color(0xFF3E85F2),
          activeTrackColor: Color(0xFFF1F2F4),
          value: status,
          onChanged: (val) {
            setState(() {
              status = val;
            });
          },
        ),
      ),
    );
  }
}
