import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:realeestateapp/Screens/MainView.dart';
import 'package:realeestateapp/api/authcontroller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.pageController});
  final PageController pageController;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService authService = AuthService();

  bool _isLoading = false;

  Future<void> _login() async {
    FocusScope.of(context).unfocus();

    setState(() {
      _isLoading = true;
    });

    final String username = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تأكد من تعبئة جميع الحقول')),
      );
      setState(() {
        _isLoading = false;
      });
      return;
    }

    try {
      await authService.loginUser(
        _emailController.text,
        _passwordController.text,
      );
      setState(() {
        _isLoading = false;
        showDialog(
          context: context,
          builder: (context) => Dialog(
            backgroundColor: Colors.transparent,
            child: Center(
              child: SizedBox(
                width: 150,
                height: 150,
                child: Lottie.network(
                  repeat: false,
                  'https://lottie.host/85cf1e95-d523-4f86-9c5f-02e8bf6bdccf/vSMazmro0x.json',
                ),
              ),
            ),
          ),
        );
      });
      Future.delayed(const Duration(milliseconds: 2000)).then(
        (value) => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => Mainview(
              signinUsername: _emailController,
            ),
          ),
        ),
      );
    } catch (e) {
      
      setState(() {
        _isLoading = false;

        showDialog(
          context: context,
          barrierDismissible: false, 
          builder: (context) => Dialog(
            backgroundColor: Colors.transparent, 
            child: Center(
              child: Container(
                width: 300,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white, 
                  borderRadius: BorderRadius.circular(20), 
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ], 
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min, 
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "يرجى التأكد من بياناتك وإعادة المحاولة.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 48, 4, 1), 
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Lottie.network(
                      'https://lottie.host/e2e0c0bc-070d-4d34-9c6f-45d755f56b74/oAdycL7QvB.json',
                      width: 150,
                      height: 150,
                      repeat: false, 
                    ),
                  ],
                ),
              ),
            ),
          ),
        );

       Future.delayed(const Duration(milliseconds:2000 )).then((_) {
  Navigator.of(context).pop(); 
});
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _header(context),
            _inputField(context),
          ],
        ),
      ),
    );
  }

  _header(context) {
    return const Column(
      children: [
        Text(
    "مرحبا مجدداً",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Text("سجل بيانات الدخول إلى حسابك "),
      ],
    );
  }

  _inputField(context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _emailController,
                textDirection: TextDirection.ltr,
                decoration: InputDecoration(
                  hintText: "إسم المستخدم",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Color.fromARGB(255, 6, 75, 102).withOpacity(0.1),
                  filled: true,
                  prefixIcon: const Icon(CupertinoIcons.person),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: "رمز الدخول",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Color.fromARGB(255, 6, 75, 102).withOpacity(0.1),
                  filled: true,
                  prefixIcon: const Icon(Icons.password),
                ),
                obscureText: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "نسيت رمز الدخول؟",
                      style: TextStyle(
                        color:  Color.fromARGB(255, 6, 75, 102),


                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 120,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Color.fromARGB(255, 6, 75, 102),
                      ),
                      child: const Text(
                        "تسجيل الدخول",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("ليس لديك حساب ؟ "),
                      TextButton(
                        onPressed: () {
                          widget.pageController.animateToPage(1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        },
                        child: const Text(
                          "سجل من هنا",
                          style: TextStyle(color:Color.fromARGB(255, 6, 75, 102),
                           fontWeight: FontWeight.bold,),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
