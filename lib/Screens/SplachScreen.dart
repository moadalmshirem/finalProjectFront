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
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Authscreen()));
         
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
        child: LottieBuilder.network("https://lottie.host/00c13860-0806-40e8-8e01-dc6866934ab6/agBz1DcS3e.json"),
      ),
    );
  }
}