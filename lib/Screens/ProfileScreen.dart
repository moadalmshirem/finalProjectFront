
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:realeestateapp/Screens/AuthScreen.dart';
import 'package:realeestateapp/widgets/cardWidget.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key ,required this.username});
  final String username ;

  @override
  State<Profilescreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<Profilescreen> {

  @override
  Widget build(BuildContext context) {
      bool isSwitched = false;

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar:   PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          decoration: BoxDecoration(
            color:Color.fromARGB(255, 6, 75, 102),
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
          ),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent, 
            title: Text(
              "الإعدادات",
             
              style: TextStyle(
              color: Colors.grey.shade200,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            toolbarHeight: 100,
            
          ),
        ),
      ),
      body: SingleChildScrollView(

        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage("assets/images/user.png",),
            ),

            SizedBox(child: Text(
              style: TextStyle(
                fontSize: 21,

              ),
              widget.username,
              )),
              SizedBox(
                height: 10,
              ),
            CardWidget(
              title: 'تسجيل الخروج ',trailing:Transform.rotate
            
              (
                angle:  270 * 3.1415926535 / 180,
                
                
                child: Icon(CupertinoIcons.share , color: Colors.redAccent.shade700,)) ,
              oniconTapped: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>Authscreen()));
              },
              ),


CardWidget(
  title: "الوضع المظلم",
  trailing: CupertinoSwitch(
    value: isSwitched,
    onChanged: (bool value) {
      setState(() {
        isSwitched = value;
      });
    },
  ),
  oniconTapped: () {
    setState(() {
    });
  },
),
          ],
        ),
      ),
    );
  }
}
