import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:realeestateapp/Screens/AuthScreen.dart';

class Splachscreen extends StatefulWidget {
  const Splachscreen({super.key});

  @override
  State<Splachscreen> createState() => _SplachscreenState();
}

class _SplachscreenState extends State<Splachscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 1950), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => Authscreen()));
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.network(
            "https://lottie.host/dcead542-b6e2-4695-9057-5225e0b1209d/GLol0fd3I9.json"),
      ),
    );
  }
}
