import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 6, 75, 102),
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(30)),
          ),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  CupertinoIcons.back,
                  size: 24,
                  color: Colors.white,
                )),
            title: Text(
              "الرسائل",
              style: TextStyle(
                  color: Colors.grey.shade200,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Cairo"),
            ),
            toolbarHeight: 100,
          ),
        ),
      ),
      body: Center(),
    );
  }
}
