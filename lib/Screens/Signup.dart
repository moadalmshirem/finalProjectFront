import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:realeestateapp/api/authcontroller.dart';

class Signup extends StatefulWidget {
  final PageController pageController;

  Signup({super.key, required this.pageController});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController =
      TextEditingController(); // Separate controller for confirmation

  final AuthService authService = AuthService();

  void _register() async {
    if (_passwordController.text != _confirmPasswordController.text) {
      // Check if passwords match
      Center(
        child: Lottie.network(
          'https://lottie.host/85cf1e95-d523-4f86-9c5f-02e8bf6bdccf/vSMazmro0x.json',
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    try {
      await authService.registerUser(
        _emailController.text,
        _passwordController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
          'تم التسجيل بنجاح ',
          style: TextStyle(fontFamily: "Cairo", fontWeight: FontWeight.w300),
        )),
      );
      widget.pageController.animateToPage(1,
          duration: Duration(seconds: 1), curve: Curves.linear);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('عذراً حدث خطأ في التسجيل  $e')),
      );
    }
  }

  @override
  void dispose() {
    // Dispose controllers when not needed
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Column(
                children: <Widget>[
                  SizedBox(height: 60.0),
                  Text(
                    "إنشاء حساب جديد ",
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: "Cairo",
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    " انشئ حسابك واستمتع بخدمات تطبيقنا",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 115, 114, 114),
                        fontFamily: "Cairo",
                        fontWeight: FontWeight.w300),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        hintText: "إسم المستخدم",
                        hintStyle: TextStyle(
                            fontFamily: "Cairo", fontWeight: FontWeight.w500),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none),
                        fillColor:
                            Color.fromARGB(255, 6, 75, 102).withOpacity(0.1),
                        filled: true,
                        prefixIcon: const Icon(Icons.person)),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: "كلمة المرور",
                      hintStyle: TextStyle(
                          fontFamily: "Cairo", fontWeight: FontWeight.w500),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none),
                      fillColor:
                          Color.fromARGB(255, 6, 75, 102).withOpacity(0.1),
                      filled: true,
                      prefixIcon: const Icon(Icons.password),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(
                      hintText: "تأكيد كلمة المرور",
                      hintStyle: TextStyle(
                          fontFamily: "Cairo", fontWeight: FontWeight.w500),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none),
                      fillColor:
                          Color.fromARGB(255, 6, 75, 102).withOpacity(0.1),
                      filled: true,
                      prefixIcon: const Icon(Icons.password),
                    ),
                    obscureText: true,
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 200,
                    height: 60,
                    padding: const EdgeInsets.only(top: 3, left: 3),
                    child: ElevatedButton(
                      onPressed: _register,
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Color.fromARGB(255, 6, 75, 102),
                      ),
                      child: const Text(
                        "إنشاء ",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: "Cairo"),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("لديك حساب ؟",
                          style: TextStyle(
                            fontFamily: "Cairo",
                          )),
                      TextButton(
                        onPressed: () {
                          widget.pageController.animateToPage(0,
                              duration: const Duration(milliseconds: 600),
                              curve: Curves.easeInOut);
                        },
                        child: const Text(
                          "سجل الدخول من هنا",
                          style: TextStyle(
                              color: Color.fromARGB(255, 6, 75, 102),
                              fontWeight: FontWeight.bold,
                              fontFamily: "Cairo"),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
