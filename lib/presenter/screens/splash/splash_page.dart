import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future<void> fetchUserOrder() async {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, "languageScreen");
    });
  }

  @override
  void initState() {
    fetchUserOrder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset('assets/images/splashlogo.svg'),
      ),
    );
  }
}
