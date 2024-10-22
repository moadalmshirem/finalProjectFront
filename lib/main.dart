import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realeestateapp/Screens/AuthScreen.dart';
import 'package:realeestateapp/Screens/SplachScreen.dart';

void main() {
  

 runApp(
          const ProviderScope(
            child: MyApp(),
            ),
            ); 
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl, 
          child: child!,
        );
      },
      debugShowCheckedModeBanner: false,
      home:
       PageView(
        controller: _controller,
        children: [
          Splachscreen(),
          Authscreen(),
        ],
      )
    );
  }
}